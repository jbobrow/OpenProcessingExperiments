
//Hearts
Heart[] hearts = new Heart [5];
int numhearts =0;


//Bear
Bear myBear;
int bodyfat=100; //width of Bear body
int happiness; //# of hearts


//Food Button
float x1 = 450;
float y1 = 50;
float w1 = 100;
float h1 = 30;
int foodClicks = 0;

//Array of Responses
String[] responses = {":D","Yay","I'm Full","Getting bloated", "Gonna explode", "Too much food", "Can't handle", "Stoppppp", "No.","Go away","STOP.","Why","T^T","UGH","BLEH", "What is life."};

boolean overFive = false;


void setup(){
  size(600,600);
  background(255);
  myBear = new Bear();
   
  hearts[0] = new Heart(50,70,40,80,60);
  hearts[1] = new Heart(100,120,90,130,110);
  hearts[2] = new Heart(150,170,140,180,160);
  hearts[3] = new Heart(200,220,190,230,210);
  hearts[4] = new Heart(250,270,240,280,260);  
  
  
}

void draw(){

  myBear.display(100); //Draw Bear
  
  //Draw Feed Button
  displayFoodButton();
    
  //Clicking Feed Button
  if(foodClicks ==1){
    myBear.display(110);
    displayFoodButton();
    hearts[0].display();
    textSize(50);
    text(responses[0],275,250); //:D
  }
  if(foodClicks ==2){
    myBear.display(120);
    myBear.move(1);
    displayFoodButton();
    hearts[0].display();
    hearts[1].display();
    textSize(50);
    text(responses[1],250,250); //Yay
  }
  if(foodClicks ==3){
    myBear.display(150);
    myBear.move(2);
    displayFoodButton();
    hearts[0].display();
    hearts[1].display();
    hearts[2].display();  
    textSize(50);
    text(responses[2],225,250); //I'm Full
  } 
  if(foodClicks ==4){
    myBear.display(170);
    myBear.move(0.5);
    displayFoodButton();
    hearts[0].display();
    hearts[1].display();
    hearts[2].display();    
    hearts[3].display();  
    textSize(40);
    text(responses[3],130,250); //Getting bloated     
  } 
  if(foodClicks ==5){    
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[4],130,250); //Gonna explode
    displayFoodButton();
    hearts[0].display();
    hearts[1].display();
    hearts[2].display(); 
  } 
  if(foodClicks == 6){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[5],130,250); //Too much food
    displayFoodButton();
    hearts[0].display();
    hearts[1].display();    
  }
  if(foodClicks == 7){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[6],130,250); //Can't handle
    displayFoodButton();
    hearts[0].display(); 
  }
  if(foodClicks == 8){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[7],150,250); //Stoppp
    displayFoodButton();
  }
  if(foodClicks == 9){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[8],130,250);
    displayFoodButton();
  }
  if(foodClicks == 10){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[9],130,250);
    displayFoodButton();
  }
  if(foodClicks == 11){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[10],130,250);
    displayFoodButton();
  }
  if(foodClicks == 12){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[11],130,250);
    displayFoodButton();
  }
  if(foodClicks == 13){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[12],130,250);
    displayFoodButton();
  }
  if(foodClicks == 14){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[13],130,250);
    displayFoodButton();
  }
  if(foodClicks == 15){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[14],130,250);
    displayFoodButton();
  }
  if(foodClicks == 16){
    displayUnhappyBear();
    fill(255,0,0);
    textSize(50);
    text(responses[15],130,250);
    displayFoodButton();
  }
  if(foodClicks ==17){
  background(255);
  text("Click again for new pet", 130,250);
  }
  if(foodClicks >=18){
  foodClicks=0;
  }
  
}

void mouseClicked(){
    if(mouseX>x1 && mouseX<x1+w1 && mouseY>y1 &&mouseY<y1+h1 && foodClicks==0){
      foodClicks = 1;
      numhearts++;
      print(numhearts);
    }  
    else if(mouseX>x1 && mouseX<x1+w1 && mouseY>y1 &&mouseY<y1+h1 && foodClicks==1){
      foodClicks = 2;
      numhearts++;
      print(numhearts);
    }    
    else if(mouseX>x1 && mouseX<x1+w1 && mouseY>y1 &&mouseY<y1+h1 && foodClicks==2){
      foodClicks = 3;
      numhearts++;
      print(numhearts);
    }  
    else if(mouseX>x1 && mouseX<x1+w1 && mouseY>y1 &&mouseY<y1+h1 && foodClicks==3){
      foodClicks = 4;
      numhearts++;
      print(numhearts);
    }      
    else if(mouseX>x1 && mouseX<x1+w1 && mouseY>y1 &&mouseY<y1+h1 && foodClicks==4){
      foodClicks = 5;
      numhearts++;
      print(numhearts);
    }          
    else if(mouseX>x1 && mouseX<x1+w1 && mouseY>y1 &&mouseY<y1+h1 && foodClicks>=5){
      foodClicks++;
      overFive = true;
      numhearts++;
      print(numhearts);
      //textSize(50);
      //text(responses[int(random(responses.length))],100,100);
    }         
}

void displayFoodButton(){
  fill(150);
  rect(x1,y1,w1,h1);
  fill(0);
  textSize(30);
  text("FEED", 465,75); 
}

void displayUnhappyBear(){
    background(255);
    stroke(0);
    fill(153,76,0);
    //Legs
    ellipse(280,575,20,30);
    ellipse(320,573,20,30);
    
    //Left ear
    ellipse (250,350,60,60);
    //Right ear
    ellipse (350,350,60,60);
    //Body
    ellipse (300,500,200,150);
    //Head
    ellipse (300,400,150,150);
    
   
    //Eyes
    fill(0);
    ellipse(275,375,10,20); //left eye
    ellipse(325,375,10,20); //right eye
    
    //Mouth
    arc(300,440,50,50,-PI,0); //Not smiling; semi-circle
}
class Bear {
  color c;
  float speedY;
  
  //Bear Y values
    float y1 = 575;
    float y2 = 573;
    float y3 = 350;
    float y4 = 350;
    float y5 = 500;
    float y6 = 400;
    float y7 = 375;
    float y8 = 375;
    float y9 = 420;

  Bear(){
    c = color(153,76,0);
    speedY = 1;
  }

  void display(int tempBodyFat){
    bodyfat=tempBodyFat;

    background(255);
    stroke(0);
    fill(c);
    //Legs
    ellipse(280,y1,20,30);
    ellipse(320,y2,20,30);
    
    //Left ear
    ellipse (250,y3,60,60);
    //Right ear
    ellipse (350,y4,60,60);
    //Body
    ellipse (300,y5,bodyfat,150);
    //Head
    ellipse (300,y6,150,150);
    
   
    //Eyes
    fill(0);
    ellipse(275,y7,10,20); //left eye
    ellipse(325,y8,10,20); //right eye
    
    //Mouth
    arc(300,y9,50,50,0,PI); //Smiling; semi-circle
  }
  
  void move(float tempSpeedY) {  
    //speedY = tempSpeedY;
    
    y1 = y1-speedY;
    y2 = y2-speedY;
    y3 = y3-speedY;
    y4 = y4-speedY;
    y5 = y5-speedY;
    y6 = y6-speedY;
    y7 = y7-speedY;
    y8 = y8-speedY;
    y9 = y9-speedY;  
  
    if(y3-30<300 || y4-30<300){
      speedY = tempSpeedY*-1;
    }
    else if (y1+5>=590 || y2+5>=590){
      speedY = speedY*-1;
    } 
  }

}
class Heart{
  color c;
  int circle1X;
  int circle2X;
  int triangle1X;
  int triangle2X;
  int triangle3X;
  
  Heart(int tempC1, int tempC2, int tempT1, int tempT2, int tempT3) {
    c = color(255,0,0);
    circle1X = tempC1;
    circle2X = tempC2;
    triangle1X = tempT1;
    triangle2X = tempT2;
    triangle3X = tempT3;
  }

  void display(){
    smooth();
    noStroke();
    fill(c);
    ellipse(circle1X,50,20,20);
    ellipse(circle2X,50,20,20);
    triangle(triangle1X,53,triangle2X,53,triangle3X,80);
 
  }

}


