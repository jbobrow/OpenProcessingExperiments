
//Eco del Mondo, Bruno Munari, 1949

//Brian Wong Sept 20, 2012
//tracing project

//setup loop + Background
//Declaring a variable of type  PImage
PImage img;

void setup() {
  size(522,740);
  smooth();
  img = loadImage ("Eco del Mondo - ARTstor Collections-1-2.jpg");
 // font=loadFont("eco.vlw");

}
void draw(){
  background(255);
  //Draw the Image to the screen at coordintate (0,0)
  tint(100);
  image(img,0,0);
  if(mousePressed){
  println("x:"+ mouseX+ "Y:" + mouseY);
  }
  //background
  stroke(178,156,117);
  strokeWeight(25);
  rect(0,0,522,740); 
  
  //ECO
  noFill();
  stroke(178,156,117);
  strokeWeight(4);
  ellipse(399,98,137,137);  //O - outline
  arc(253,98,137,137,radians(45),radians(290));  //C outline
  
  line(154,62,154,34);  //E
  line(154,34,44,34);
  line(44,34,44,46);
  line(44,46,59,46);
  line(59,46,59,150);
  line(59,150,44,150);
  line(44,150,44,164);
  line(44,164,154,164);
  line(154,164,154,136);
  
  line(101,48,101,90);  //E |
  line(101,103,101,148);
  line(130,82,130,109);
  
  line(124,48,101,48);  //E -
  line(124,48,154,63);
  line(101,90,130,82);
  line(101,103,130,109);
  line(101,148,154,136);

  line(246,66,246,146);  //C |
  line(306,36,306,78);
  
 // line(278,34,306,36);  //C -
 // line(246,66,306,78);
 // line(246,146,302,146);
  
  
  line(386,65,386,142);  //O |
  line(414,65,414,142);
  arc(400,65,27,27,radians(180),radians(360));
  arc(400,143,27.5,27,radians(0),radians(180));
  
//center  
  noStroke();
//yellow Rect
  fill(228,190,45);
  rect(184,370,161,178);
//blue Rect
  fill(88,102,131);
  rect(184,310,161,60);
//yellow triangle
  fill(208,186,137);
  triangle(184,310,257,161,345,310);    //top triangle
  triangle(345,310,422,245,488,397);   //tRight triangle
  triangle(184,310,34,401,184,548);    //left triangle
  triangle(184,548,115,608,257,679);   //bLeft trianlge
//Red triangle
  fill(173,51,28);
  triangle(184,310,102,245,34,401);  //tLeft Triangle
  triangle(184,548,257,679,345,548);  //Bottom Triangle
  triangle(345,548,488,397,437,585);  //bLeft triangle
//Pink triangle
  fill(175,81,97);
  triangle(345,310,257,161,422,245);  //tRight triangle
  triangle(345,548,257,679,437,585);  //bRight triangle
  triangle(184,548,34,401,115,608);  //bLeft triangle
//Green triangle
  fill(140,143,86);
  triangle(184,310,257,161,102,245);  //tLeft triangle
  triangle(345,310,488,397,345,548);  //Right triangle


  textSize(44);
 // textFont(font,44);
  text("DEL MONDO",125,712);
  stroke(0);
  text("ECO",225,350);
  fill(0);
  textSize(20);
  text("il mensile",218,407);
  text("del cittadino",203,434);
  text("del mondo",212,460);
  textSize(13);
  text("EDEL MONDO",224,366);
  textSize(9);
  text("12% pagine",197,500);
  text("100 Hre", 290,500);
  text("25  periedire  Mondadori",205,536);
  
  // font = loadFont("Imprint MT Shadow.FOND"); 
}



