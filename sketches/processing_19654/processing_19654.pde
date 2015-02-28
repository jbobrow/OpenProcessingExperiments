
//Julie Park
//Recreate an Image
//1/23/11

float colorValue;

void setup(){ 
  size(600,450); 
  colorValue = 0;
}

//my reference 
//http://fc09.deviantart.net/fs70/f/2010/186/3/5/8_Bit_Goomba_by_thekingofthevikings.jpg

void draw()
{
  background(colorValue);
  colorValue = map(mouseX,0,width,0,255); // what we learned in class with bg color changes
  fill(0,0,255);
if(dist(mouseX,mouseY,300,300) < 50){
  fill(255,0,0);
}

  fill(234,120,43); //orange color of the goomba
  noStroke();

  //top of the goomba head
  //the math is x - 25, y + 25

  rect(255,30,25,25);
  rect(280,30,25,25);
  rect(305,30,25,25);
  rect(330,30,25,25);

  //second row of "pixels"

  rect(230,55,25,25);
  rect(255,55,25,25);
  rect(280,55,25,25);
  rect(305,55,25,25);
  rect(330,55,25,25);
  rect(355,55,25,25);

  //3rd row

  rect(205,80,25,25);
  rect(230,80,25,25);
  rect(255,80,25,25);
  rect(280,80,25,25);
  rect(305,80,25,25);
  rect(330,80,25,25);
  rect(355,80,25,25);
  rect(380,80,25,25);

  //4th

  rect(180,105,25,25);
  rect(205,105,25,25);
  rect(230,105,25,25);
  rect(255,105,25,25);
  rect(280,105,25,25);
  rect(305,105,25,25);
  rect(330,105,25,25);
  rect(355,105,25,25);
  rect(380,105,25,25);
  rect(405,105,25,25);

  //5th now comes the white and black

  rect(155,130,25,25);

  fill(0,0,0); //black
  rect(180,130,25,25);
  rect(205,130,25,25);

  fill(234,120,43); //orange
  rect(230,130,25,25);
  rect(255,130,25,25);
  rect(280,130,25,25);
  rect(305,130,25,25);
  rect(330,130,25,25);
  rect(355,130,25,25);

  fill(0,0,0); //black
  rect(380,130,25,25);
  rect(405,130,25,25);

  fill(234,120,43);
  rect(430,130,25,25);

  //6th row

  rect(130,155,25,25);
  rect(155,155,25,25);
  rect(180,155,25,25);

  fill(255,255,255); //white
  rect(205,155,25,25);

  fill(0,0,0); //black
  rect(230,155,25,25);

  fill(234,120,42);  //orange
  rect(255,155,25,25);
  rect(280,155,25,25);
  rect(305,155,25,25);
  rect(330,155,25,25);

  fill(0,0,0); //black
  rect(355,155,25,25);

  fill(255,255,255); //white
  rect(380,155,25,25);

  fill(234,120,43);
  rect(405,155,25,25);
  rect(430,155,25,25);
  rect(455,155,25,25);

  //7th row

  rect(130,180,25,25);
  rect(155,180,25,25);
  rect(180,180,25,25);

  fill(255,255,255);
  rect(205,180,25,25);

  fill(0,0,0);
  rect(230,180,25,25);
  rect(255,180,25,25);
  rect(280,180,25,25);
  rect(305,180,25,25);
  rect(330,180,25,25);
  rect(355,180,25,25);

  fill(255,255,255);
  rect(380,180,25,25);

  fill(234,120,43);
  rect(405,180,25,25);
  rect(430,180,25,25);
  rect(455,180,25,25);

  //8th

  rect(105,205,25,25);
  rect(130,205,25,25);
  rect(155,205,25,25);
  rect(180,205,25,25);

  fill(255,255,255);
  rect(205,205,25,25);

  fill(0,0,0);
  rect(230,205,25,25);

  fill(255,255,255);
  rect(255,205,25,25);

  fill(234,120,43);
  rect(280,205,25,25);
  rect(305,205,25,25);

  fill(255,255,255);
  rect(330,205,25,25);

  fill(0,0,0);
  rect(355,205,25,25);

  fill(255,255,255);
  rect(380,205,25,25);

  fill(234,120,43);
  rect(405,205,25,25);
  rect(430,205,25,25);
  rect(455,205,25,25);
  rect(480,205,25,25);

  //9th

  rect(105,230,25,25);
  rect(130,230,25,25);
  rect(155,230,25,25);
  rect(180,230,25,25);

  fill(255,255,255);
  rect(205,230,25,25);
  rect(230,230,25,25);
  rect(255,230,25,25);

  fill(234,120,43);
  rect(280,230,25,25);
  rect(305,230,25,25);

  fill(255,255,255);
  rect(330,230,25,25);
  rect(355,230,25,25);
  rect(380,230,25,25);

  fill(234,120,43);
  rect(405,230,25,25);
  rect(430,230,25,25);
  rect(455,230,25,25);
  rect(480,230,25,25);

  //10th

  rect(105,255,25,25);
  rect(130,255,25,25);
  rect(155,255,25,25);
  rect(180,255,25,25);
  rect(205,255,25,25);
  rect(230,255,25,25);
  rect(255,255,25,25);
  rect(280,255,25,25);
  rect(305,255,25,25);
  rect(330,255,25,25);
  rect(355,255,25,25);
  rect(380,255,25,25);
  rect(405,255,25,25);
  rect(430,255,25,25);
  rect(455,255,25,25);
  rect(480,255,25,25);

  //11th

  rect(130,280,25,25);
  rect(155,280,25,25);
  rect(180,280,25,25);
  rect(205,280,25,25);

  fill(255,215,134);
  rect(230,280,25,25);
  rect(255,280,25,25);
  rect(280,280,25,25);
  rect(305,280,25,25);
  rect(330,280,25,25);
  rect(355,280,25,25);

  fill(234,120,43);
  rect(380,280,25,25);
  rect(405,280,25,25);
  rect(430,280,25,25);
  rect(455,280,25,25);

  //12th

  fill(255,215,134);
  rect(205,305,25,25);
  rect(230,305,25,25);
  rect(255,305,25,25);
  rect(280,305,25,25);
  rect(305,305,25,25);
  rect(330,305,25,25);
  rect(355,305,25,25);
  rect(380,305,25,25);

  //13th

  fill(0,0,0);
  rect(155,330,25,25);
  rect(180,330,25,25);

  fill(255,215,134);
  rect(205,330,25,25);
  rect(230,330,25,25);
  rect(255,330,25,25);
  rect(280,330,25,25);
  rect(305,330,25,25);
  rect(330,330,25,25);
  rect(355,330,25,25);
  rect(380,330,25,25);

  //14th

  fill(0,0,0);
  rect(130,355,25,25);
  rect(155,355,25,25);
  rect(180,355,25,25);
  rect(205,355,25,25);
  rect(230,355,25,25);

  fill(255,215,134);
  rect(255,355,25,25);
  rect(280,355,25,25);
  rect(305,355,25,25);
  rect(330,355,25,25);
  rect(355,355,25,25);

  fill(0,0,0);
  rect(380,355,25,25);
  rect(405,355,25,25);

  //15th

  rect(130,380,25,25);
  rect(155,380,25,25);
  rect(180,380,25,25);
  rect(205,380,25,25);
  rect(230,380,25,25);
  rect(255,380,25,25);

  fill(255,215,134);
  rect(280,380,25,25);
  rect(305,380,25,25);
  rect(330,380,25,25);

  fill(0,0,0);
  rect(355,380,25,25);
  rect(380,380,25,25);
  rect(405,380,25,25);
  
  //16th
  
  rect(155,405,25,25);
  rect(180,405,25,25);
  rect(205,405,25,25);
  rect(230,405,25,25);
  rect(255,405,25,25);
  rect(330,405,25,25);
  rect(355,405,25,25);
  rect(380,405,25,25);
  
}

