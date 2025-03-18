/// Prints the lyrics to the Christmas carol “The Twelve Days of Christmas,” taking advantage of the repetition in the song.
/// Exercise suggested in "The Rust Programming Language" - Chapter 3, Section 5.
fn main() {
    let twelve_days_of_xmas = [
        "a partridge in a pear tree.",
        "two turtle doves and",
        "three French hens,",
        "four calling birds,",
        "five golden rings,",
        "six geese a-laying,",
        "seven swans a-swimming,",
        "eight maids a-milking,",
        "nine ladies dancing,",
        "ten lords a-leaping,",
        "eleven pipers piping,",
        "twelve drummers drumming,",
    ];

    let ordinals = [
        "first", "second", "third", "fourth", "fifth", "sixth",
        "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth",
    ];

    for day in 0..12 {
        println!("On the {} day of Christmas, my true love gave to me", ordinals[day]);

        for gift in (0..=day).rev() {
            println!("{}", twelve_days_of_xmas[gift])
        }

        println!();
    }
}
