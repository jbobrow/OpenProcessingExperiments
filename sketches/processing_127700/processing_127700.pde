
//Camila Diaz    
//10/1/14
//Moving mouse




void setup() {  //setup function called initially, only once
  size(600,600);
 
}

void draw() {              //draw function loops
     background(0,255,255);          //set background light blue
  
        fill(224,224,224);                                //grey
        ellipse(mouseX+360,mouseY + 240,65,65);    //right ear
        ellipse(mouseX+240,mouseY+240,65,65);        //left ear
        ellipse(mouseX+300,mouseY+300,115,115);    //head
    
        fill(0,0,0);                            //black
        ellipse(mouseX+300,mouseY+310,15,15); //nose
        
        fill(255,255,255);                        //white
        ellipse(mouseX+275,mouseY+280,25,25);    //left eye
        ellipse(mouseX+325,mouseY+280,25,25);    //right eye
        
        fill(0,0,0);                            //black
        ellipse(mouseX+275,mouseY+280,5,5);    //left eye dot
        ellipse(mouseX+325,mouseY+280,5,5);    //right eye dot
            
        fill(0,0,0);                            //black
        rect(mouseX+285,mouseY+335,25,2);    //mouth
    
 
 }
