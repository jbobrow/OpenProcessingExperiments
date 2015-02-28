

int eSize = 3;
 
size(400, 565);//wakunoookisa
background(255);//siro

 



{
line(225, 215, 295, 200); //uehanbunguraikuro
   strokeWeight(600);
  line(300, 150, 150, 150);
  
    strokeWeight(75);//migisitakurotama1
 stroke(0, 0, 0, 255 );
  line(400, 425, 400, 425);

      strokeWeight(75);//migisitakurotama2
 stroke(0, 0, 0, 255 );
  line(320, 425, 320, 425);
  
        strokeWeight(75);//migisitakurotama3
 stroke(0, 0, 0, 255 );
  line(240, 425, 240, 425);
  
        strokeWeight(75);//migisitakurotama4
 stroke(0, 0, 0, 255 );
  line(160, 425, 160, 425);
  
          strokeWeight(75);//migisitakurotama5
 stroke(0, 0, 0, 255 );
  line(80, 425, 80, 425);
  
           strokeWeight(75);//migisitakurotama6
 stroke(0, 0, 0, 255 );
  line(0, 425, 0, 425);
  
  for(int y = 0; y <= height; y +=10){//yokuwakaran
  for(int x = 0; x <= width; x += 40){
    ellipse(x, y, eSize, eSize);     
   if(5 <= 100 && 200 < 250){
     fill(255, 0, 0);
     
     noStroke();   //doutai
ellipse(260, 280, 140, 39); 

stroke(255, 0, 0);     //sebire
strokeWeight(20);  
line(225, 265, 295, 267); 


stroke(255, 0, 0);     //sitabire
strokeWeight(20);  
line(225, 295, 295, 285); 
   }

  }
  }
  
 float pie_w = 50;  //obire
float pie_h = 50;  
int lastAngle = 150;   
int angle0 = 60;   

noStroke();
 
fill(255, 0, 0);//aka
 
arc(width/2, height/2, pie_w, pie_h, radians(lastAngle), radians(lastAngle + angle0));
 



}



