

//import japplemenubar.*;

PFont font, font2;
boolean looop = false; 
boolean dragged = false;
boolean intro = true;
float transY = 0;
PImage[] images;


  ////////////////////////////
  // DRAW Contants
  ///////////////////////////  
   float keyheight = 99;
   float mouseYpos = 0;
   float mouseXpos = 0; //Only for decoration, for now
   
   float yimgsize2 = 0;
   float ximgsize2 = 0;
   float secondstart2 = 0;
   float txtstart2 = 0;
   float textsze2 = 0;
   float xtrans = 0;
   
   float lyear = 2011;
   float fyear = 1935;
  // float frange = 1939;
  // float lrange = 2011;
   
   float zoom = 1;
   float zoom2 = 1;
   
    ////////////////////////////
    // STart Getting Count
    ////////////////////////////
    


////////////////////////////
// STart Setup
////////////////////////////

      void setup(){
        
        
            //Get the VARS
     XMLElement xml = new XMLElement(this, "events2.xml");
    //XMLElement xmlChild = xml.getChild(84); //gets you into the root folder this can be hard number since there can only be one root folder
    int count = xml.getChildCount();//counts songs
        
       size(1280, 800); 
    //   size(1280, 708); 
       background(255);
       colorMode(RGB, 255,255,255,100);
       font = loadFont("DIN.vlw"); 
       font2 = loadFont("Georgia-48.vlw"); 
       noCursor();
 
 ///////////////////////
 //Load Images... just once
 ///////////////////////
         
         images = new PImage[100];
         
         for (int i= 0; i < count; i++){
           XMLElement xmlChild = xml.getChild(i); 
           int attCount = xmlChild.getChildCount();
           XMLElement xmlGrandChild = xmlChild.getChild(0); //GET THE ID of the event        
           int imgkey = int(xmlGrandChild.getContent()); 
           images[imgkey] = loadImage(imgkey + ".jpg");
        }//END FOR
} 



void draw(){ 


    //Get the VARS
     XMLElement xml = new XMLElement(this, "events2.xml");
    //XMLElement xmlChild = xml.getChild(84); //gets you into the root folder this can be hard number since there can only be one root folder
    int count = xml.getChildCount();//counts songs  
  
  ////////////////////////////
  // DRAW Contants
  ////////////////////////////
   
   float xaxis = 0;
   float nextxaxis = 0;
   
   float yr = 0;
   float yaxis = 0;
   
   //COPY OF TOP  - COPY OF TOP//
   
   float xint =  (width/(lyear-fyear)) * zoom;
   float maxwidth = xint * (lyear - fyear);

   
   //COPY OF TOP  - COPY OF TOP//  
  
   float yimgsize = (zoom * 100) + (width/100);
   float ximgsize = yimgsize;
   float secondstart = yimgsize * 2;
   float textsze = zoom + (width/(width*0.9));
   
   float yearstart = keyheight + (2 * zoom);
   float imgstart = (keyheight + (2 * zoom)) + textsze;
   float txtstart = (imgstart + yimgsize) * 100;
   
   
   float maximgsize = 0;
   float maxyimgsize = 0;
   
  if(!looop){   
  ////////////////////////////
  // Load the Info
  ////////////////////////////   
 
   // Declare 2D array
   String[][] distances;
   distances = new String[width][height];

   for (int i= 0; i < count; i++)
     {
        XMLElement xmlChild = xml.getChild(i); //gets you into the root folder this can be hard number since there can only be one root folder
       int attCount = xmlChild.getChildCount();//counts song info types, which are children too
       for (int j = 0; j < attCount; j++)
           {
         XMLElement xmlGrandChild = xmlChild.getChild(j);
         String content = (xmlGrandChild.getContent());
         String name = xmlGrandChild.getName();
          distances[i][j] = content; 
          
      //    println(content + " / " + i);
          
        }//END 2nd FOR
     }//END FOR  

  ////////////////////////////
  // DRAW BACKGROUND
  ////////////////////////////  
 
        background(255);     
  
  ////////////////////////////
  // DRAW EVERYTHING
  ////////////////////////////
       
  pushMatrix();     
       
  //Determine Xaxis
  fill(0);
  xaxis = -((mouseX * zoom));
  yaxis = ((-(mouseY) + (height - keyheight)/2 - 100) * (zoom/5)) + (keyheight + (height - keyheight)/2 - 100);
  
 // println(yaxis + " / " + ((height - keyheight)/2 - 100) + " / " + (-((mouseY * zoom))));
  
  if(maxwidth > width){ //Let's Check that we actually can do this.. 
      if(xaxis < (-(maxwidth - width))){
        xaxis = (-(maxwidth - width));
      }
      translate(xaxis, yaxis);
  }

  else{
    translate(0, (height - keyheight)/2 - 100);
  }
  
  
 //Draw every instance
 //The Loop
 
  for (int i= 0; i < count; i++){
   //Detrmine X axis 
   yr = int(distances[i][3]);
   xaxis = ((yr - fyear) * xint);
   //println( xaxis + " / " + yr + " / " + fyear + " / " + xint);
   nextxaxis = (((yr + 1) - fyear) * xint);
   
   stroke(255,0,0);
 //  line(nextxaxis, 0, nextxaxis, height);
   stroke(255,255,0);
  // line(nextxaxis+1, 0, nextxaxis+1, height);
   
    //Display Text
    
    //Determine Y axis   
    int imp = int(distances[i][4]);
    //Set up IF statemetn to see if it is positive or negative)
    if((imp % 2) == 0 && imp != 0){
      imp = -(imp)/2;
    }
    if((imp % 2) == 1 && imp != 0){
      imp = imp/2 + 1;
    }    
   
   yaxis  = (1 + (imp * 5));  
    
  fill(0,0,0,(zoom*8)); 
    
  //Decalre ID
  int id = int(distances[i][0]);
  
  //Start Loop Depending on IMAGE
   textFont(font, textsze);
   textAlign(LEFT);
   
   if(images[id] != null){
     ximgsize = yimgsize * (float(images[id].width)/float(images[id].height));
     
      maximgsize = (nextxaxis - xaxis) - (2 * zoom);
      ximgsize = maximgsize;
      yimgsize = ximgsize * (float(images[id].height)/float(images[id].width));
      secondstart = yimgsize * 2;
      txtstart = imgstart + yimgsize + (1*zoom) + 2;
      
      //Setup Max Y Size
      
      if((float(images[id].height)/float(images[id].width)) > 2){
        maxyimgsize = ((nextxaxis - xaxis) - (2 * zoom)) * 2; //The Max X img size * 2
        yimgsize = maximgsize;
        ximgsize = ximgsize * (float(images[id].width)/float(images[id].height));
        secondstart = yimgsize * 2;
        txtstart = imgstart + yimgsize + (1*zoom) + 2;        
      }
      

     image(images[id], (xaxis + (1 * zoom)), (imgstart + (secondstart * imp)), ximgsize, yimgsize);
     
       //Display Description Text
     text(distances[i][1], (xaxis + (1 * zoom)), (txtstart + (secondstart * imp)), ximgsize, yimgsize * 2);
  
   }
   else {
     ximgsize = yimgsize * (400/300); // USE same function. Insert typical aspect ration of image
     //Display Description Text
     text(distances[i][1], (xaxis + (1 * zoom)), (imgstart + (secondstart * imp)), ximgsize, yimgsize * 2);
   }
  
   
    //Display A line and the Year
   stroke(150);
   strokeWeight(1);
   line((xaxis), -(height * 5), (xaxis), height * 5);
   
   //Display The Year
   text(int(yr), (xaxis + (1 * zoom)), yearstart + (secondstart * imp));
  }
  
  ////////////////////////////
  // DRAW Key AGAIN
  //////////////////////////// 
  
   
 popMatrix();
   
  
   fill(255,255,255,97);
   noStroke();
   rect(0,0,width, keyheight);  
   stroke(150);
   fill(50);
   

  //Make the Numbers
      for (int i= 0; i < count; i++){
          if(float(distances[i][4]) == 0){
            //Xaxis  
            xaxis = (int(distances[i][3]) - fyear) * ( width / (lyear-fyear));
            //Draw the line
            stroke(200);
            line(xaxis, keyheight - 10, xaxis, keyheight-1);
            //Draw the Year
            textAlign(LEFT);
            textFont(font, 8);
            text(distances[i][3], xaxis, keyheight - 15);
          }
      }
      drawkey(); 
      
 }
 else {
  
   //What Happens if the Loop isnt Playing?
   
 }
 
 if(dragged){
  //println("Dragged"); 
   textFont(font, 32);

   //DRAW KEY
   
   fill(200, 200, 200, 50);
   rect(0,keyheight ,width, height);  
   
   textAlign(LEFT);
   fill(0);
   
   line(mouseX, mouseYpos, mouseX, mouseY);
   text("ZOOM " + int(zoom*5) +"%", (mouseX + 10), (mouseY + 10));
    
   line(0,mouseYpos,width,mouseYpos);
   text("Increase ZOOM", 200, (mouseYpos - 18));
   text("Decrase ZOOM", 200, (mouseYpos + 40));   
 }
 
 
 if(intro){
   PImage introimg = loadImage("intro2.png");
   
  fill(0,0,0,50);
  rect(0,0,width,height);
 
   //Put the Image Here
  image(introimg, (width/2) - (float(introimg.width)/2), (height/2) - (float(introimg.height)/2), (float(introimg.width)), (float(introimg.height)));
// image(introimg, 200, 200, 200, 200);
 }
 
}


////////////////////////////
// PUBLIC FUNCTIONS
////////////////////////////

void drawkey(){
  
  
      stroke(220);
      line(0,keyheight, width, keyheight);
   
      //Draw a line accross
      stroke(0);
      
      //Make the title
      fill(0);
      textFont(font, 36);
      textAlign(LEFT);
      text("Richard Serra / 1939 - Present", 40,60);
      
      //Make Guide LIne
        //extend this code      
        //With Zoom and mouseX Determien where in the plane you are
        
        float mousepos = mouseX;
        float mouseXaxis = mousepos + (((lyear - fyear) * ( width / (lyear-fyear)))/zoom);
        //Check if there is no overextending
        if(mouseXaxis >= width){
           mouseXaxis = width - 1; 
           mousepos = mouseXaxis - (((lyear - fyear) * ( width / (lyear-fyear)))/zoom);
           println(mousepos + " / " + mouseXaxis);
        }        
        else{
         mousepos = mousepos; 
        }
                
        //Draw all 3 lines
        line(mousepos, keyheight - 10, mousepos, keyheight);
        line(mouseXaxis, keyheight - 10, mouseXaxis, keyheight);   
        stroke(0,0,0,50);
        line(mousepos + 3, keyheight - 5, mouseXaxis - 3, keyheight - 5);
        
      
      //Make Cursos
      stroke(0);
      line(mouseX, mouseY + 3, mouseX, mouseY - 3);
      line(mouseX + 3, mouseY, mouseX - 3, mouseY);
  
      fill(0);
      textFont(font, 18);
      textAlign(RIGHT);
      text("ZOOM: "+ int(zoom * 5) + "% // Press ENTER for Into and Key", width - 40,40);
      
}

////////////////////////
//  Responsive Functions
////////////////////////

void mouseDragged() 
{
   if(!looop){
        if(mouseYpos == 0){
        mouseYpos = mouseY;
        mouseXpos = mouseX;
        zoom2 = zoom;
        }
        else {
          transY = (mouseYpos - mouseY);
          zoom = ((mouseYpos - mouseY)/25) + zoom2;
          
          if(zoom > 20){
           zoom = 20; 
          }
          
          if(zoom < 1){
           zoom = 1; 
          }
          
          int zoomshow = int(zoom * 5); //this
      
          
        }
        dragged = true; 
   }
}

void mouseReleased() {
  transY = 0;
  mouseYpos = 0;
  dragged = false;
}

void keyPressed() {
  
  if (key == ' ') {
   if(looop){
     looop = false;
     noCursor();
   }
   else {
    looop = true;
    cursor();
   }
  }
  
  if (key == ENTER) {
   if(intro){
     intro = false;
 //    looop = true;
     noCursor();
   }
   else {
    intro = true;
//   looop = false;
    cursor();
   }
  }
}

void mousePressed(){
 if(intro){
     intro = false;
     noCursor();
   }
}




