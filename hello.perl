#!/usr/bin/perl

for my $n (1..100) {
    !($n % 15) ?    say "FizzBuzz"    :   
    !($n % 3)  ?    say "Fizz"        :  
    !($n % 5)  ?    say "Buzz"        : 
                    say "$n";           
}
