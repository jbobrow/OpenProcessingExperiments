
int x = 0;
long num = 600851475143L;

while(num != 1) {
    String lines[] = loadStrings("Primes.txt");
  if (num%PApplet.parseInt(lines[x]) == 0) {
    num = num/PApplet.parseInt(lines[x]);
//    print(PApplet.parseInt(lines[x]) + ":  ");
//    println(num);
  } 
  else {
    x++;
  }
}

String lines[] = loadStrings("Primes.txt");
text("ANS: " + PApplet.parseInt(lines[x]),10,50);




