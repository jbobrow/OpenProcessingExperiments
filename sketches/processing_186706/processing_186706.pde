
//declare variables outside of function boxes
int sizer;
int fx,fy;






void setup (){//set initial values


size(400,400);//size of canvas

background(255);//color of background

noFill();
strokeWeight(5); //thickness of strokes
for(int i=0;i<=400;i+=10){
   for (int p=0;p<=200;p+=5) {

sizer=10; //declaring integer "sizer"
  
  stroke(i*2); 
 ellipse(width/2,height/2,i*2,i*2);//circle pattern in background

 rect(0,0,p*2,p*2); //rectangular background pattern
   }
}
}




void draw (){


  
  if(mousePressed && mouseButton==LEFT){//if left mouse pressed, fill with black
    
    fx+=(mouseX-fx)*.01; //slow speed
    fy+=(mouseY-fy)*.01;
    fill(0);
    noStroke();
    ellipse(fx,fy,sizer,sizer); //size and shape of ellipse
  }else
   if(mousePressed&&mouseButton==RIGHT){//if right mouse pressed, fill with dark blue/gray
     fill(75,105,119); //color of ellipse

  }else{//if no button pressed, draw nothing
    noFill();
  }
  noStroke();

    ellipse(mouseX,mouseY,7,20);//draw ellipses at current location with right or left button pressed
    
    
    
 
  if(mousePressed&&mouseButton==CENTER){//if center button is pressed, draw ellipse in dark red/gray
    fx+=(mouseX-fx)*.9;//fast when following mouse
    fy+=(mouseY-fy)*.9;
    fill(143,50,52);
    noStroke();
    ellipse(fx,fy,mouseX/10,mouseY/10); //ellipses become smaller or greater depending on location 
    
    
    
    
}

}


