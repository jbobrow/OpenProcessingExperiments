
//Selfie

void setup (){
//Canvas
size (500,500);

//Background
background(150,200,140);

smooth();

}

void draw (){
noStroke();
//style hoved
fill(250,220,180);
ellipseMode(CENTER);
ellipse(width/2, height/2, 250, 300);

//næsebor
fill(187, 133, 116);
ellipse(240, 270, 10, 10);
ellipse(260, 270, 10, 10);

//Øjne
fill(255);
ellipse(200,220, 50, 40);
ellipse(300,220, 50, 40);

//iris
fill(38, 167, 83);
ellipse(195,220, 30, 30);
ellipse(303,215, 30, 30);

//pupiller
fill(0);
ellipse(195,220, 15, 15);
ellipse(303,215, 15, 15);

//pupiller flare
fill(255);
ellipse(190,215, 5, 5);
ellipse(298,210, 5, 5);

//Mund
fill(255, 79, 236);
triangle(220, 310, 280, 310, 250, 325);

//Hår
fill(147, 114, 71);
triangle(250, 150, 320, 95, 400, 230);
triangle(250, 150, 180, 95, 100, 230);
ellipse(250,100,200,100);

//øjenbryn
stroke(147, 114, 71);
strokeWeight(5);
line(170,190,225,190);
line(275,190,360,190);

//blink med øjnene
if (mousePressed == true) {
    noStroke();
  fill(240,200,160);
ellipse(200,220, 51, 41);
ellipse(300,220, 51, 41);
  } else {
    noStroke();
    fill(187, 133, 116);
  }

println(mouseX + "." + mouseY);
}

