
PImage topBar;
PImage menu;
PImage menuDrop;
PImage share;
PImage shareDrop;
PImage appBorder;
PImage masthead;
PImage issue;
PImage myFace;
PImage clone;
boolean cloneSwitch = false;
int[] hoverColor = {
    40,73,255
};
//int cols, rows;
int brushSize; //floats are more flexible
float x = 100;
float y = 0;
float vx = 0;
float vy = 0;
float gravity = .1;
float frictionx = .999; 
float frictiony = -.5;  




void setup(){

  size(768,1024);
 // colorMode(HSB, 100,100,100);
  smooth();
  rectMode(CENTER);
  topBar = loadImage("top_bar.png");
  menu = loadImage("menu.png");
  menuDrop = loadImage("menu_drop.png");
  share  = loadImage("share.png");
  shareDrop = loadImage("share_drop.png"); 
  appBorder = loadImage("iPad_new.png");
  masthead = loadImage("masthead_2.png");
  issue = loadImage("issue.png");
  myFace = loadImage("me.png");
  clone = createImage(brushSize, brushSize, ARGB);
  //image(topBar,0,0);
  image(appBorder,0,0);
  image(myFace,0,0);

  brushSize = 50;
}


void draw(){ 
/////////////////////// Makes Tool Functions Work ///////////////////  
  if(keyPressed){
     if(key == 'c' || key == 'C'){
        cloneStamp(101,158,560,764);
     } 
  }  
  
    if(keyPressed){
     if(key == 'h' || key == 'H'){
    fill(90,57,19);
    noStroke();
      beginShape();
        vertex(mouseX - 13,mouseY + 11);
        bezierVertex(mouseX -13,mouseY + 16,mouseX + 12,mouseY - 3,mouseX + 6,mouseY - 7);
        bezierVertex(mouseX + 6,mouseY - 7,mouseX + 6,mouseY + 2,mouseX - 13,mouseY + 10);
        vertex(mouseX - 13,mouseY + 11);
      endShape();
     } 
  }
  
  loadPixels();
  noFill();  
//      if(mouseX < 203 && mouseX > 257 && mouseY < 953 && mouseY > 1007){
//      int[] hoverColor = {
//            40,73,255,0
//      };
//    }

// 2. Clone Button  
    if(mouseX > 203 && mouseX < 257 && mouseY > 953 && mouseY < 1007){
            if(mousePressed){
             //   cloneStamp(101,158,560,764);
               // cloneSwitch = true;                                    
              }else{ 
                  noStroke();
                  fill(hoverColor[0], hoverColor[1], hoverColor[2],5);
                  ellipse(229,980,54,54);   

                 }  
                
              }else{           
                  image(appBorder,0,0);
                  image(menu,0,13);
                  image(share,713,15);
                  image(topBar,0,0);
                  
               }



///////////// Title Drop///////////
  image(masthead,x+144,y);
  rectMode(CENTER);
       x += vx;
       y += vy;
       vy += gravity;
       vx *= frictionx;
    //  x = x + 2;
  
  if(y > 49){
      y = 49;
      vy *= frictiony - .02;
      
        if(y < 51){
          y = 51;
          vy = frictiony - frictiony;
          gravity = gravity - gravity;
        }
  }
  
image(topBar,0,0);  // So that it is in front of/on top of Masthead


///////////// Menu Drop///////////
  
  if(mouseX > 0 && mouseX< 55 && mouseY > 43 && mouseY < 96){
    if(mousePressed){                              
              }else{ 
                 
                /////
                image(menuDrop,x-100,y+16);
                  rectMode(CENTER);
                       x += vx;
                       y += vy;
                       vy += gravity;
                       vx *= frictionx;
                  if(y > 49){
                      y = 49;
                      vy *= frictiony - .02;
                        if(y < 51){
                          y = 51;
                          vy = frictiony - frictiony;
                          gravity = gravity - gravity;
                        }
                  }
              } 
               image(menu,0,13);
               image(topBar,0,0);
               ////
              }else{           
              }
              
              
///////////// Share Drop///////////
  
  if(mouseX > 713 && mouseX< 768 && mouseY > 43 && mouseY < 96){
    if(mousePressed){       
              }else{ 
                 
                /////
                image(shareDrop,x+613,y+22);
                  rectMode(CENTER);
                       x += vx;
                       y += vy;
                       vy += gravity;
                  if(y > height){
                      y = height;
                      vy *= frictiony - .02;
//                        if(y < 51){
//                          y = 51;
//                          vy = frictiony - frictiony;
//                          gravity = gravity - gravity;
//                        }
                  }
              } 
              image(share,713,15);
              image(topBar,0,0);
               ////
              }else{           
              } 
              
              
              
              
             
    
// 6. Hair Button
//    if(mouseX > 106 && mouseX < 662 && mouseY > 106 && mouseY < 922){
//              if(mousePressed){
//              hair(0,0);
//              }
//     }
    

// Clear Button  
    if(mouseX > 0 && mouseX < 54 && mouseY > 170 && mouseY < 229){
              if(mousePressed){
                image(myFace,0,0);
              }
    }         

}

////////////////////////////// FUNCTIONS /////////////////////////////


//////// Button 1 Grab effect ///////
          // some day...
//////// Button 2 effect ////////////

void cloneStamp(int x, int y, int _x, int _y){
   // rect(mouseX-(brushSize/2), mouseY-(brushSize/2), brushSize,brushSize);

  
  clone = get(mouseX, mouseY, brushSize/2, brushSize/2);
  
  for(int i = 0; i < clone.height; i++){
    for(int j = 0; j < clone.width; j++){
        
        if(dist(mouseX, mouseY, i, j) > brushSize/2){ //recognize distance area withing diameter = 20 so/2 = 10
            
        color c = color(0, 0);
       // clone.(i, j, c );  
        }
    }  
  }
  image(clone, mouseX-30,mouseY-30);
}

//////// Button 3 Smooth/Smudge effect ////////
          // some day...
          
//////// Button 4 Freckles effect ////////////
          // some day...
       
//////// Button 5 Pimples effect ////////////
          // some day...

//////// Button 6 Hair effect ////////////
//void hair(){
//    fill(90,57,19);
//    noStroke();
//      beginShape();
//        vertex(mouseX - 13,mouseY + 11);
//        bezierVertex(mouseX -13,mouseY + 16,mouseX + 12,mouseY - 3,mouseX + 6,mouseY - 7);
//        bezierVertex(mouseX + 6,mouseY - 7,mouseX + 6,mouseY + 2,mouseX - 13,mouseY + 10);
//        vertex(mouseX - 13,mouseY + 11);
//      endShape();
//}




//////// Button 6 Erase Effect Only...effect ////////////
          //?





