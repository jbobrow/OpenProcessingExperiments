
float dir=-1;                  //direction of change
float tinto=255;               //base number

void setup(){
  size(300,300);               //window size
  background(0);               //black
  frameRate(30);               //speed of flash
  noStroke();                  //no stroke
  fill(255,255,0);             //yellow
}

void draw(){
  ellipse(150,150,250,175);    //yellow oval
  
   fill(0);
  rect(127,80,10,125);         //left
  rect(137,90,22,127);         //middle big
  rect(159,80,10,125);         //right
  rect(40,125,220,50);         //wing base
  rect(146,90,5,140);          //middle skinny
  
  rect(50,115,10,80);          //left1
  rect(60,105,10,90);          //left2
  rect(70,95,10,50);           //left3
  rect(80,85,10,50);           //left4
  rect(90,120,10,20);          //left5
  rect(90,85,10,10);           //left6
  rect(117,120,62,60);         //left7
  rect(50,150,30,30);          //left8
  rect(100,150,100,30);        //left9
  rect(107,170,7,25);          //left10
  rect(60,190,10,10);          //left11
  rect(69,199,7,7);            //left12
 
  
  rect(240,115,10,80);         //right12
  rect(230,105,10,90);         //right11
  rect(220,95,10,85);          //right10
  rect(210,85,10,50);          //right9
  rect(200,120,10,20);         //right8
  rect(200,85,10,10);         //right7
  rect(117,120,62,60);        //right6
  rect(50,150,30,30);         //right5
  rect(100,150,100,30);       //right4
  rect(186,170,7,25);         //right3
  rect(230,190,10,10);        //right2
  rect(224,199,7,7);         //right1
  
  tinto=tinto+dir*5; //equation 
  if (tinto<0){    //setting the lowest color
    dir=1;         //getting lighter
  }
  if (tinto> 255){ //setting lightest color
    dir=-1;        //getting darker
  }
  fill(tinto,tinto,0); //yellow
  
}

