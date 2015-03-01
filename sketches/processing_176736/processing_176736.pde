
//variables posicion de las helices
int topX = 250;
int topY = 140;
int topX2 = 250;
int topY2 = 140;
int leftX = 155;
int leftY = 330;
int leftX2 = 155;
int leftY2 = 330;
int rightX = 345;
int rightY = 330;
int rightX2 = 345;
int rightY2 = 330;
int midRightX = 365;
int midRightY = 200;
int botX = 250;
int botY = 375;
int midLeftX = 135;
int midLeftY = 200;

//accionadores

boolean midR = false;
boolean midL = false;
boolean bot = false;
boolean left = false;
boolean right = false;
boolean top = true;

//movimiento variables
int i = 0;
int j = 0;
int w = 0;
int z = 0;

//accionador movimiento
boolean helice = true;
 
//variables imagen
PImage ciudad;
int screensizex , screensizey;

void setup(){

  size(900,900);
  
}

void draw(){
  screensizex = 900;
  screensizey = 900;
  ciudad = loadImage("ciudad.jpg");
  image(ciudad,0,0,screensizex,screensizey);
  println(mouseX + "," + mouseY);
  //helicoptero
  strokeWeight(3);
  fill(76,153,0);  
  ellipse(381,424,150,300);
  //cola helicoptero
  fill(76,153,0);
  rect(370,575,20,215);
  rect(320,715,50,30);
  rect(390,715,50,30);
  //ventanas
  fill(0,255,255);
  triangle(328,348,374,348,375,309);
  triangle(386,349,428,349,388,309);
  line(355,343,361,331);
  //barras
  line(308,383,289,384);
  line(324,521,306,522);
  line(290,364,307,535);
  line(452,374,464,372);
  line(438,519,451,522);
  line(462,357,447,537);
  
  //Hélices traseras
  strokeWeight(1);
 
   line (352,682, random (350,360), random(790,795));
  
  //Hélices
  fill(0);
  ellipse(380,432,50,50);
  strokeWeight(20);
  fill(0);
  //line(175,438,588,438);
  //line(379,237,379,642);
  line(510,269,246,588);
  line(231,266,533,604);
  /*rect(371,241,15,200);
  rect(177,431,200,15);
  rect(373,439,15,200);
  rect(386,430,200,15);*/
  //fin de dibujo helicoptero

  
  

  //bucles

   if (helice == true){
        if (i < 3){
        if(i == 0){
        fill(0,0,0);
        line(175,438,588,438);
        /*line(379,237,379,642);
        line(510,269,246,588);
        line(231,266,533,604);*/
        
      }else if(i <= 3){
        
       }
        while(top == true){
        topX = midLeftX;
        topY = midLeftY;
        rightX2 = midRightX;
        rightY2 = midRightY;
        leftX2 = botX;
        leftY2 = botY;
        top = false;
        right = false;
        left = false;
        midL = true;
        midR = false;
        bot = false;
        }
        ++i;
        }else if(i >= 3 && i < 6){
        if(i >= 4 && i < 6){         
        fill(0,0,0);
        line(379,237,379,642);  
      }
       
       
       
       
        while(midL == true){
        topX = leftX;
        topY = leftY;
        rightX2 = topX2;
        rightY2 = topY2;
        leftX2 = rightX;
        leftY2 = rightY;
        top = false;
        right = false;
        left = true;
        midL = false;
        midR = false;
        bot = false;
        }
        ++i;
        }else if(i >= 6 && i < 9){
        if(i > 6 && i <= 9){
        fill(0,0,0);
        line(231,266,533,604);  
      
    }
        
        
        
      /* while(left == true){
        topX = botX;
        topY = botY;
        rightX2 = midLeftX;
        rightY2 = midLeftY;
        leftX2 = midRightX;
        leftY2 = midRightY;
        top = false;
        right = false;
        left = false;
        bot = false;
        midR = false;
        midL = true;       
        }
        ++i;       
        }else if(i >= 9 && i < 12){
        if(i > 9 && i <= 12){
        fill(0,0,0);
        line(510,269,246,588);  No funcionaaaaa!!!
      
       
       
       
       /*while(bot == true){
        topX = rightX;
        topY = rightY;
        rightX2 = leftX;
        rightY2 = leftY;
        leftX2 = topX2;
        leftY2 = topY2;
        top = false;
        bot = false;
        right = true;
        left = false;
        midR = false;
        midL = false;
        }
        ++i;
        }else if(i >= 12 && i < 15){
        if(i > 12 && i <= 15){
        fill(0,0,0);
        line(510,269,246,588);  
        }*/
      
      
      
      
      
      /* while(right == true){
        topX = midRightX;
        topY = midRightY;
        rightX2 = botX;
        rightY2 = botY;
        leftX2 = midLeftX;
        leftY2 = midLeftY;
        top = false;
        bot = false;
        right = false;
        left = false;
        midR = true;
        midL = false;
        }
        ++i;
        }else if(i >= 15 && i < 18){
        if(i == 15){
        fill(0,0,0);
        line(510,269,246,588);
        }*/
        
        
        
        while(midR == true){
        topX = 250;
        topY = 140;
        rightX2 = 345;
        rightY2 = 330;
        leftX2 = 155;
        leftY2 = 330;
        top = true;
        bot = false;
        right = false;
        left = false;
        midR = false;
        midL = false;
        }
        j = j + 80;
        w = w + 80;
        z = z - 80;
        i = 0;
        //}
  
 

 
  
  
  




   }

   }

}




