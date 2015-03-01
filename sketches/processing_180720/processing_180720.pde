
//Aly Weir
//This program creates random colored lines 
//when you click the screen
//Try varying the length of your click for different effects

void setup(){
  size(500,500);//sets size to 500x500
}

void draw(){  
  int w = 10; //width of rect
  float h = random(0,100);//height of rect

  int x = 0;//how far across the page
  float y;//how low or high on the page

  for( int i = x; i<=width; i = i + w*2 ){ //draws a line of rect, changes x position
    noStroke();    //takes away stroke
    if(mousePressed == true){//if the mouse is pressed
      y = random(50,350); //sets y height randomly within 150-250 when mouse clicked
      fill(random(100,200), random(50,150), random(200,300));//sets random shade of purple when mouse clicked
    }
    else{
      y = 200; //when the mouse isn't clicked the y position will be 200
    }
   rect( i,y, w,h );//draws rect  
  }
}


