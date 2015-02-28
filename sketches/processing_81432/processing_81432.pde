
//www.census.gov/
//Declare variable of PImage
PImage img = loadImage ("US Pop.png");

void setup(){
  size(700,700);
  //load image
  img = loadImage ("US Pop.png");
}

void draw(){
  background (0);
  image(img, 200, 150, width/2, height/2);
  
  //Title
  fill(255);
  textSize(20);
  text("Population for the Five Largest States by Land Area in the U.S.",60,100);
  
  //Alaska Pop
  fill(188,25,158);

  if(mouseX>210&&mouseX;<300&&mouseY;>350&&mouseY;<450){
  ellipse(240,390,100,100);
  textSize(12);
  fill(0);
    text("Alaska Pop.",210,390);
    text("714,146",215,410);
}

  //Cali Pop
  fill(188,25,158);

  if(mouseX>210&&mouseX;<240&&mouseY;>220&&mouseY;<350){
  ellipse(210,280,100,100);
  textSize(12);
  fill(0);
    text("California Pop.",170,280); 
    text("37,338,198",175,300);
}
  //New Mexico Pop
  fill(188,25,158);

  if(mouseX>310&&mouseX;<340&&mouseY;>300&&mouseY;<360){
  ellipse(320,330,105,105);
  textSize(12);
  fill(0);
    text("New Mexico Pop.",272,330); 
    text("2,065,913",285,350);
}

  //Texas Pop
  fill(188,25,158);

  if(mouseX>350&&mouseX;<400&&mouseY;>310&&mouseY;<420){
  ellipse(360,370,100,100);
  textSize(12);
  fill(0);
    text("Texas Pop.",330,370); 
    text("25,253,466",325,390);
}
  //Montana Pop
  fill(188,25,158);

  if(mouseX>260&&mouseX;<350&&mouseY;>180&&mouseY;<220){
  ellipse(310,180,100,100);
  textSize(12);
  fill(0);
    text("Montana Pop.",270,180); 
    text("990,958",280,200);
}
}
