
String lines[] = loadStrings("http://kristim.com/Stanley.txt");
size(1000,1000);
background(0);
for (int i = 0 ; i < lines.length; i++) {
  fill(100,random(255),random(255));
  rotate(random(2*PI));
  textAlign(CENTER,CENTER);
  textSize(random(20)+5);
  text(lines[i],random(500)+250,random(500)+250);

}



