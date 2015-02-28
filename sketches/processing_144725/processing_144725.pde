
//STASE PAXTON//
//INT ART OSU FINAL PROJECT//

//INTELLECTUAL PROPERTY//
//......................................//

//global variables
String joinedPoem; //declare array for text
int posX;
int posY;
float circX;
float circY;
float newX;
float newY;
  float e;
    float t;
    float g;
    float r;
void setup(){
  
  size(600,600);
 background(#FFFAE3);
  frameRate(5);
  
  String [] poem = loadStrings("poem.txt");    //ENTER TEXT HERE
  joinedPoem = join(poem, " ");                  //join poem with spaces not individual words
  //joinedPoem = split(joinedPoem, " ");
 
 // println(joinedPoem.length());              //test
}//end setup

void draw(){
   posY = 120;                                //array original position
   posX = 20;
   r = random(10);
   t = random(200);
   e = random(10);
   
   rectMode(CENTER);
   noStroke();
   smooth();
   
   for( int i = 0; i < joinedPoem.length(); i++){        //loop through the charcters for all the functions below
    fill(#093242,0);
    text(joinedPoem.charAt(i), posX, posY);          //writing individual text in individual corrordinates
   // println(joinedPoem.charAt(i));
    
    
    
    posX +=textWidth(joinedPoem.charAt(i)) + 1;//textWidth is width of individual letter. pos x moves the space of the last textWidth
    if(posX >= width-100 && joinedPoem.charAt(i) == ' ' ){   //so it stays on the page and doesnt cut off a word
      posX = 20;
      posY +=30;
    }//end if
  
  
  // scanSource() ? 
  
  
    //for( int j = 0; j < joinedPoem.length(); j++){
    circX = 20;
    circY = 70; 
  
    
    char c = joinedPoem.charAt(i);  //get a char  
    //float index = joinedPoem.indexOf(c);
     float index = textWidth(c);
     //newX = circX;
      //newX += index;//textWidth is width of individual word. pos x moves the space of the last textWidth
      newX += joinedPoem.indexOf(c);
     // println(index);
     // noLoop();
      if(newX >= width-100 && joinedPoem.charAt(i) == ' ' ){   //do it stays on the page and doesnt cut off a word
     newX = 20;
      newY +=30;
      newX += joinedPoem.indexOf(c);
    //  }else{
      //  newX = 20;
     //   circY = 70; 
      }//end of small if/else
    if ( index >=11.0){
     // fill(0);
      //rect( newX+2, newY, index,15);
      fill(#FC3F49, 50);//red
     rect(newX, newY ,  random(30), random(30));
    
  }else if ( index ==10.0 ){
     // fill(0);
      //rect(newX+2, newY, index , 10);
     fill(#FC7C26, 50); //yellow
     rect(newX, newY ,  random(30), random(30));
     
   }else if (index == 9.0){
     // fill(0);
     // rect(newX, newY, index, 4);
     fill(#D14C17, 50); //brown
       rect(newX, newY , random(30), random(30));
     
    }else if(index == 8.0){
     // fill(0);
     // rect(newX, newY, index, 8);
     fill(#FAB89D,50);
     rect(newX, newY ,  random(30), random(30));
       
  }else if(index == 7.0){
      //fill(0);
      //rect(newX, newY, index, 7);
      fill(#4B3DE3,50);
     rect(newX, newY ,  random(30), random(30));
       
   } else if (index == 6.0){
      //fill(0);
      //rect(newX, newY, index, 18);
      fill(#3DE3CD, 50);
     rect(newX, newY ,  random(30), random(30));
  
}else if(index == 5.0){
         //fill(0);
        // rect(newX, newY, index, 20);
         fill(#BF0D43, 50);
        rect(newX, newY ,  random(30), random(30));
         
 }else if(index == 4.0){
       // fill(0);
      // rect(newX, newY, index, 5);
       fill(#F0D4FA, 50);
       ellipse(newX, newY, 30, 30);
           
}else{
         // fill(0);
        //  rect(newX,newY, index, 17);
          fill(#1BB9F7,50);
         rect(newX, newY ,  random(30), random(30));
        }//of of large if/else
     
    //  if (mousePressed){
  // for( int j = 0; j < joinedPoem.length(); j++){        //loop through the charcters for all the functions below
   // fill(0);
   // text(joinedPoem.charAt(j), posX, posY);
 //  }//end of for
    //  }//end of if
  }//end for loop
}//end of draw
  //}  
  
//}

//void scanCharacters(){
  //scanCharacters();  
      //println(mouseX);
//}  
