import Foundation

enum Direction {
  case L // left
  case R // right
}

struct Rotation {
  var direction: Direction;
  var delta: Int;
}

/// Input file example:
/// L68
/// L30
/// R48
func parseInputFile(atPath filePath: String) -> [String] {
  let url = URL(fileURLWithPath: filePath)
  var parsed: [String] = []
  
  do {
      let contents = try String(contentsOf: url, encoding: .utf8)
  
      let tokens = contents.components(separatedBy: .newlines)
      for token in tokens {

          parsed.append(token)
      }
  } catch {
      print("Failed to read file:", error)
  }

  return parsed
}

func parseRotations(rotations: [String]) -> [Rotation] {
  var parsedRotations = [Rotation]()

  rotations.forEach { rotation in
    var parsedRotation = Rotation(direction: .L, delta: 0)  // TMCH
    if rotation.first == "L" {
      parsedRotation.direction = .L
    }
    else {
      parsedRotation.direction = .R
    }

    let delta = rotation.dropFirst()
    parsedRotation.delta = Int(delta)!

    parsedRotations.append(parsedRotation)
  }

  return parsedRotations
}

// 0...99, pointer starts at 50 on first rotation
func computeCombination(_ rotations: [Rotation]) -> Int {
  var zeroCount = 0
   var currentIndex = 50 // dial arrow points at 50 on start

  rotations.forEach { rotation in
    // if 99 is crossed over, wrap
    switch rotation.direction {
      case .R: // sum
        currentIndex += rotation.delta
        if(currentIndex > 99) {
          currentIndex %= 100
        }
        if(currentIndex == 0) {
          zeroCount += 1
        }
        break;
  
    // if 0 is crossed over, wrap
    case .L: // subtract
      currentIndex -= rotation.delta
      if(currentIndex < 0) {
        currentIndex = (currentIndex + 100) % 100
      }
      if(currentIndex == 0) {
        zeroCount += 1
      }
      break;
    }
  }

  return zeroCount
}

var parsedInputFile = parseInputFile(atPath: "./day_1_input.txt")
var parsedRotations = parseRotations(rotations: parsedInputFile)
var combination = computeCombination(parsedRotations)
print(combination)
