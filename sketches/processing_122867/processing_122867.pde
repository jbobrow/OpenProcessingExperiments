
void setup() {
  size(1000, 1000);            //grootte van het document
}

void draw() {
  background(255);           //een witte achtergrond
  rectMode(CENTER);  
  ellipse(81, 70, 10, 20);
  fill(255);
  stroke(0);                 //zwarte omranding
  fill(150, 0, 0);                 //lichaamskleur
  rect(mouseX, mouseY, 20, 100);   //lichaam
  fill(255);                 //hoofdkleur
  ellipse(mouseX-19, mouseY-30, 10, 20);   //pupil links
  ellipse(mouseX, mouseY-30, 60, 60);  
  fill(100, 0, 0);                   //ogenkleur
  ellipse(mouseX-19,mouseY-30, 16, 32);   
  ellipse(mouseX+19,mouseY -30, 16, 32);  
  stroke(0);                  //zwarte omlijning

  line(mouseX -10, mouseY +50, mouseX -20,mouseY +80);    //arm links
  line(mouseX +10, mouseY +50, mouseX +20, mouseY +80);  //arm rechts
  line(mouseX -30, mouseY -60, mouseX -10, mouseY -40);      //boze wenkbrauwen
  line(mouseX +30, mouseY -60, mouseX +10, mouseY -40);    //boze wenkbrauwen
  ellipse(mouseX, mouseY-7, 30, 15);  //mond
  line(mouseX -10, mouseY, 60, 120);    //armen
  line(mouseX +10, mouseY, 140, 120);  //armen
  ellipse(mouseX -19,mouseY -30, 10, 20);
  fill(0);


  fill(0);

  fill(255);

}

