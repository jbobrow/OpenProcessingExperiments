
public class kassi{

 float x = 0;
 float box_speed = 18;
 float xxx;
 float xxo;
 float xxu;
 int l = 100;
 int g=150;
 int kassiHeight=640;

 void kassi(){
   x = width / 4;

 }

 void reset(float timategund, int gegnumskin){
   x = (width / 4);
   l = (int)((float)box_speed * (float) timategund / (float)frameRate * .625);
   
  

 }

 void draw(int litur, int att, int lina){
   noStroke();

   fill(10,150);
   rect((int)x, dia, l, kassiHeight - (2 * dia));

if (litur == 1){
  fill(255);
}else if (litur == 2){
  fill (255,0,0);
}




  if(att == 28) {
     ellipse(x+dia, kassiHeight/1.4, 2*dia, 1.7*dia);
     xxx = dia*2;
       g = 150;
  }else if(att == 29){
     ellipse(x+dia, kassiHeight/1.5, 2*dia, 1.7*dia);
     xxx = kassiHeight - (dia*1.9); 
       g = 150;    
 }else if (att == 31){
    ellipse(x+dia, kassiHeight/1.6, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 150; 
 }else if (att == 32){
    ellipse(x+dia, kassiHeight/1.7, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 250; 
       strokeWeight(5);
       stroke(0);
       beginShape();
       vertex(x+dia, kassiHeight/1.8);
       vertex(x+dia, kassiHeight/1.62);
       bezierVertex(x+dia, kassiHeight/1.62, x+dia*2, kassiHeight/1.64, x+dia, kassiHeight/1.7);
       endShape();
 }else if (att == 34){
    ellipse(x+dia, kassiHeight/1.7, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 250; 
       strokeWeight(5);
       stroke(0);
       line(x+dia/1.5, kassiHeight/1.78, x+dia/1.5, kassiHeight/1.65);
       line(x+dia*1.3, kassiHeight/1.78, x+dia*1.3, kassiHeight/1.65);
       line(x+dia/2, kassiHeight/1.72, x+dia*2, kassiHeight/1.72);
       line(x+dia/2, kassiHeight/1.68, x+dia*2, kassiHeight/1.68); 
 }else if (att == 35){
    ellipse(x+dia, kassiHeight/1.8, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 150; 
 }else if (att == 36){
    ellipse(x+dia, kassiHeight/2, 2*dia, 1.7*dia);
     xxx = kassiHeight/1.97;   
       g = 150; 
       strokeWeight(5);
       stroke(255,g);
       line(x-dia/2.2, kassiHeight/2, x+dia*2.5, kassiHeight/2);
 }else if (att == 37){
    ellipse(x+dia, kassiHeight/2.15, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.1; 
       g = 250; 
       strokeWeight(5);
       stroke(0);
       beginShape();
       vertex(x+dia, kassiHeight/2.35);
       vertex(x+dia, kassiHeight/2);
       bezierVertex(x+dia, kassiHeight/2, x+dia*2, kassiHeight/2, x+dia, kassiHeight/2.15);
       endShape();
 }else if (att == 39){
    ellipse(x+dia, kassiHeight/2.4, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 150; 
 }else if (att == 40){
    ellipse(x+dia, kassiHeight/2.4, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 150; 
 }else if (att == 41){
    ellipse(x+dia, kassiHeight/2.62, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 150; 
 }else if (att == 42){
    ellipse(x+dia, kassiHeight/2.62, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 250; 
       strokeWeight(5);
       stroke(0);
       line(x+dia/1.5, kassiHeight/2.8, x+dia/1.5, kassiHeight/2.4);
       line(x+dia*1.3, kassiHeight/2.8, x+dia*1.3, kassiHeight/2.4);
       line(x+dia/2, kassiHeight/2.7, x+dia*1.7, kassiHeight/2.7);
       line(x+dia/2, kassiHeight/2.5, x+dia*1.7, kassiHeight/2.5);
 }else if (att == 43){
    ellipse(x+dia, kassiHeight/3, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 150; 
 }else if (att == 44){
    ellipse(x+dia, kassiHeight/3.4, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 250; 
       strokeWeight(5);
       stroke(0);
       beginShape();
       vertex(x+dia, kassiHeight/3.7);
       vertex(x+dia, kassiHeight/3.1);
       bezierVertex(x+dia, kassiHeight/3.1, x+dia*2, kassiHeight/3.1, x+dia, kassiHeight/3.45);
       endShape();
       
 }else if (att == 48){
    ellipse(x+dia, kassiHeight/4.7, 2*dia, 1.7*dia);
     xxx = kassiHeight/5; 
       g = 150; 
 }else if (att == 49){
    ellipse(x+dia, kassiHeight/5.8, 2*dia, 1.7*dia);
     xxx = kassiHeight/6; 
       g = 250; 
       strokeWeight(5);
       stroke(0);
       beginShape();
       vertex(x+dia, kassiHeight/6.7);
       vertex(x+dia, kassiHeight/5);
       bezierVertex(x+dia, kassiHeight/5, x+dia*2, kassiHeight/5.5, x+dia, kassiHeight/6);
       endShape();
       
 }else if (att == 52){
    ellipse(x+dia, kassiHeight/7.6, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 150; 
 }else if (att == 53){
    ellipse(x+dia, kassiHeight/10.7, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
       g = 150; 
 }
   
    
    
   noFill(); 
   strokeWeight(5);
   stroke(255,g);
    
    
    //pistlaust
         if (lina == 1){
       point(x+dia, xxx+dia); 
       }
       else if (lina == 2){
       point(x+dia, xxx-dia); 
       }
  
        //pitsad
       if (lina == 3){
       //  point(x+dia, xxx+dia*1.5); 
         line (x+dia/2, xxx+dia, x+dia*1.5, xxx+dia);
       }
         else if (lina == 4){
       //  point(x+dia, xxx-dia*1.5); 
         line (x+dia/2, xxx-dia, x+dia*1.5, xxx-dia);
       }  

  
   
      //aherzlu
       if(lina == 5){
         xxx=xxx+dia;
   line(x+dia*0.5, xxx, x+dia, xxx+dia/2);
   line(x+dia, xxx+dia/2, x+dia*1.5, xxx);
       }
       else if (lina == 6){
         xxx=xxx-dia;
   line(x+dia*0.5, xxx, x+dia, xxx-dia/2);
   line(x+dia, xxx-dia/2, x+dia*1.5, xxx);
       }

      //dynamik
       if(lina == 7){
         beginShape();
         vertex(x+dia/1.2, kassiHeight/1.2);
         vertex(x+dia, kassiHeight/1.4);
         bezierVertex(x+dia, kassiHeight/1.45, x+dia*1.5, kassiHeight/1.45, x+dia*1.5, kassiHeight/1.35);
         endShape();
         line (x+dia/2, kassiHeight/1.3, x+dia*1.5, kassiHeight/1.3);
       }

      if(lina == 8){
         beginShape();
         vertex(x+dia/1.2, kassiHeight/1.2);
         vertex(x+dia, kassiHeight/1.4);
         bezierVertex(x+dia, kassiHeight/1.45, x+dia*3, kassiHeight/1.43, x+dia, kassiHeight/1.32);
         endShape();
       }



   x = x - box_speed;
  

 }

}

