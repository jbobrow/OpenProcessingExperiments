
int i=0;


lines={"Hello this is your text1",
"Hello this is your text1",
"Hello this is your text1",
"Hello this is your text1",
"Hello this is your text1"};


void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
}

void draw() {

  if (mousePressed || mouseDragged) {
    
    fill(random(255), random(255), random(255), random(255));
    //String lines[]= loadStrings("loadstrings.txt");
    //if (dist(mouseX,mouseY, pmouseX,pmouseY) > 19)
    text(lines[i], mouseX, mouseY);
    i++;
    if (i >= lines.length)
    {
          i = 0;
    }
    textSize(60);
   } // if

}

