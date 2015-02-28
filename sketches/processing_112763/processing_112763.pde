
float xpos;
char letter = 'a'; 
size(1500, 400);
float letterSize;
float letterSpace;

for (int i = 97; i < 122 ; i++) {
  print(letter);
  textAlign(CENTER);
  //  textMode(CENTER);
  letterSize = map(letter, 97, 122, 5, height-200);
  xpos = map(letter, 97, 122, 20, width-20);

  textSize(letterSize);
  letterSpace= textWidth(char(letter));
  println(letterSpace);
  text(letter, xpos, height/2); 
  letter++;
}
