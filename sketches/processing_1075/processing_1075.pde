
public class kassi{

 float x = 0;
 float box_speed = 8;
 float xxx;
 float xxo;
 float xxu;
 int l = 100;
 int g=150;
 int kassiHeight=300;

 void kassi(){
   x = width / 4;

 }

 void reset(float timategund, int gegnumskin){
   x = (width / 4);
   l = (int)((float)box_speed * (float) timategund / (float)frameRate * .625);
   
  

   
   
   
 }

 void draw(int litur, int att, int mynd, int lina){
  


   fill(litur,g);
   rect((int)x, dia, l, kassiHeight - (2 * dia));
  
 
  

  

 
   
   noStroke();
   fill(10,10,10,g+30);
 
 
 
  if (att == 61){
   g = 0;

   noFill();
   noStroke();
   
  }else if(att == 60){
   //  line(x, 1.5 * dia, x + l, kassiHeight - (1.5 * dia));
     ellipse(x+dia, 1.9*dia , 2*dia, 1.7*dia);
     xxx = dia*2;
     xxo = kassiHeight - (dia*2.3);
     xxu = -60;
       g = 150;
  }else if(att == 48){
 //    line(x, kassiHeight - 1.5 * dia, x + l, (1.5 * dia));
     ellipse(x+dia, kassiHeight - (1.9*dia) , 2*dia, 1.7*dia);
     xxx = kassiHeight - (dia*1.9); 
     xxo = kassiHeight - (dia*1.3);
     xxu = 115;
       g = 150;
     
 } 
   
    
    
   noFill(); 
   strokeWeight(5);
   stroke(20,20,20,g);
    
    
    
  if (lina == 1){ 
         if (att == 60){
       point(x+dia, xxx+dia); 
       }
       else if (att == 48){
       point(x+dia, xxx-dia); 
       }
   
   }
  
  
  
   
  if (lina == 2){ 
      
       if (att == 60){
         point(x+dia, xxx+dia*1.5); 
         line (x+dia/2, xxx+dia, x+dia*1.5, xxx+dia);
       }
         else if (att == 48){
         point(x+dia, xxx-dia*1.5); 
         line (x+dia/2, xxx-dia, x+dia*1.5, xxx-dia);
       } 
   } 
   
   
   
  if (lina == 3){ 
       if(att == 60){
         xxx=xxx+dia;
   line(x+dia*0.5, xxx, x+dia, xxx+dia/2);
   line(x+dia, xxx+dia/2, x+dia*1.5, xxx);
       }
       else if (att == 48){
         xxx=xxx-dia;
   line(x+dia*0.5, xxx, x+dia, xxx-dia/2);
   line(x+dia, xxx-dia/2, x+dia*1.5, xxx);
       }
       
   }
  
  
   
      if (lina == 4){ 

  strokeWeight(2);
 
  pushMatrix();
  translate(0, xxu);
   
   beginShape();
   curveVertex(x-dia, xxo/2);
   curveVertex(x, xxo/2);
   curveVertex(x+l/4.7, xxo/2);
   curveVertex(x+l/4.6, xxo/1.9);
   curveVertex(x+l/4.5, xxo/1.9);
   curveVertex(x+l/4.4, xxo/2.1);
   curveVertex(x+l/2.7, xxo/1.9);
   curveVertex(x+l/2.6, xxo/1.8);
   curveVertex(x+l/2.5, xxo/2.3);
   curveVertex(x+l/2.4, xxo/1.9);
   curveVertex(x+l/1.8, xxo/1.9);
   curveVertex(x+l/1.4, xxo/1.9);
   curveVertex(x+l/1.2, xxo/1.9);
   curveVertex(x+l/1.1, xxo/2);
   curveVertex(x+l, xxo/2);
   curveVertex(x+l+dia, xxo/2);
   endShape(); 
   
        
   beginShape();
   curveVertex(x-dia, xxo/2);
   curveVertex(x, xxo/2);
   curveVertex(x+l/6.7, xxo/2);
   curveVertex(x+l/5.8, xxo/2.2);
   curveVertex(x+l/5.1, xxo/2.3);
   curveVertex(x+l/4.4, xxo/2);
   curveVertex(x+l/2.9, xxo/2);
   curveVertex(x+l/2.6, xxo/1.9);
   curveVertex(x+l/2.4, xxo/1.8);
   curveVertex(x+l/2.1, xxo/2);
   curveVertex(x+l/1.9, xxo/2);
   curveVertex(x+l/1.7, xxo/2.2);
   curveVertex(x+l/1.4, xxo/2.1);
   curveVertex(x+l/1.2, xxo/2);
   curveVertex(x+l, xxo/2);
   curveVertex(x+l+dia, xxo/2);
   endShape();      
       
   
   beginShape();
   curveVertex(x-dia, xxo/2);
   curveVertex(x, xxo/2);
   curveVertex(x+l/4.7, xxo/2);
   curveVertex(x+l/4.6, xxo/1.7);
   curveVertex(x+l/4.5, xxo/1.6);
   curveVertex(x+l/4.4, xxo/1.9);
   curveVertex(x+l/2.7, xxo/1.9);
   curveVertex(x+l/2.6, xxo/1.7);
   curveVertex(x+l/2.5, xxo/1.7);
   curveVertex(x+l/2.4, xxo/1.8);
   curveVertex(x+l/1.8, xxo/1.8);
   curveVertex(x+l/1.4, xxo/1.7);
   curveVertex(x+l/1.2, xxo/1.7);
   curveVertex(x+l/1.1, xxo/2);
   curveVertex(x+l, xxo/2);
   curveVertex(x+l+dia, xxo/2);
   endShape(); 
  
  popMatrix();  
       
   }
   
      if (lina == 5){ 
        strokeWeight(5);
        line(x, xxx, x+l, xxx);
     
   }
   
      if (lina == 6){ 
        
  strokeWeight(7);
 
  pushMatrix();
  translate(0, xxu);
   
    beginShape();

   vertex(x, xxo/2);
   vertex(x+l/4.7, xxo/2);
   vertex(x+l/4.6, xxo/1.7);
   vertex(x+l/4.5, xxo/1.6);
   vertex(x+l/4.4, xxo/1.9);
   vertex(x+l/2.7, xxo/1.9);
   vertex(x+l/2.6, xxo/1.7);
   vertex(x+l/2.5, xxo/1.7);
   vertex(x+l/2.4, xxo/1.8);
   vertex(x+l/1.8, xxo/1.8);
   vertex(x+l/1.4, xxo/1.6);
   vertex(x+l/1.2, xxo/1.6);
   vertex(x+l/1.1, xxo/2);
   vertex(x+l, xxo/2);

   endShape(); 
   
   beginShape();
   vertex(x, xxo/2);
   vertex(x+l/4.7, xxo/2);
   vertex(x+l/4.6, xxo/1.7);
   vertex(x+l/4.5, xxo/1.6);
   vertex(x+l/4.4, xxo/2);
   vertex(x+l/2.7, xxo/2);
   vertex(x+l/2.6, xxo/2.2);
   vertex(x+l/2.5, xxo/2.1);
   vertex(x+l/2.2, xxo/2);
   vertex(x+l/1.4, xxo/2);
   vertex(x+l/1.3, xxo/2.3);
   vertex(x+l/1.2, xxo/2.2);
   vertex(x+l/1.1, xxo/2);
   vertex(x+l, xxo/2);
   endShape(); 
        
   beginShape();

   vertex(x, xxo/2);
   vertex(x+l/6.7, xxo/2);
   vertex(x+l/5.8, xxo/2.2);
   vertex(x+l/5.1, xxo/2.3);
   vertex(x+l/4.4, xxo/2);
   vertex(x+l/2.9, xxo/2);
   vertex(x+l/2.6, xxo/1.9);
   vertex(x+l/2.4, xxo/1.8);
   vertex(x+l/2.1, xxo/2);
   vertex(x+l/1.9, xxo/2);
   vertex(x+l/1.7, xxo/2.2);
   vertex(x+l/1.4, xxo/2.1);
   vertex(x+l/1.2, xxo/2);
   vertex(x+l, xxo/2);

   endShape();      
        
   beginShape();

   vertex(x, xxo/2);
   vertex(x+l/4.9, xxo/2);
   vertex(x+l/4.6, xxo/1.7);
   vertex(x+l/4.3, xxo/1.8);
   vertex(x+l/4.1, xxo/2);
   vertex(x+l/2.9, xxo/2);
   vertex(x+l/2.7, xxo/2.4);
   vertex(x+l/2.4, xxo/2.2);
   vertex(x+l/2.1, xxo/2);
   vertex(x+l/1.23, xxo/2);
   vertex(x+l/1.15, xxo/1.7);
   vertex(x+l/1.1, xxo/1.7);
   vertex(x+l/1.08, xxo/2);
   vertex(x+l, xxo/2);

   endShape(); 
   
   beginShape();
   vertex(x, xxo/2);
   vertex(x+l/4.7, xxo/2);
   vertex(x+l/4.6, xxo/2.2);
   vertex(x+l/4.5, xxo/2.3);
   vertex(x+l/4.4, xxo/2);
   vertex(x+l/3.7, xxo/2);
   vertex(x+l/3.6, xxo/1.8);
   vertex(x+l/3.5, xxo/1.8);
   vertex(x+l/3.4, xxo/2);
   vertex(x+l/1.8, xxo/2);
   vertex(x+l/1.7, xxo/1.8);
   vertex(x+l/1.6, xxo/1.7);
   vertex(x+l/1.5, xxo/2);
   vertex(x+l, xxo/2);
   endShape(); 
  
   beginShape();
   vertex(x, xxo/2);
   vertex(x+l/7.7, xxo/2);
   vertex(x+l/7.6, xxo/1.7);
   vertex(x+l/6.5, xxo/1.8);
   vertex(x+l/6.0, xxo/2);
   vertex(x+l/3.9, xxo/2);
   vertex(x+l/3.7, xxo/1.9);
   vertex(x+l/3.4, xxo/1.912);
   vertex(x+l/3.2, xxo/2.01);
   vertex(x+l/1.18, xxo/2.07);
   vertex(x+l/1.15, xxo/2.1);
   vertex(x+l/1.1, xxo/2.13);
   vertex(x+l/1.01, xxo/2);
   vertex(x+l, xxo/2);
   endShape(); 

   
   
   beginShape();

   vertex(x, xxo/2);
   vertex(x+l/4.7, xxo/2);
   vertex(x+l/4.6, xxo/1.7);
   vertex(x+l/4.5, xxo/1.6);
   vertex(x+l/4.4, xxo/1.9);
   vertex(x+l/2.7, xxo/1.9);
   vertex(x+l/2.6, xxo/1.7);
   vertex(x+l/2.5, xxo/1.7);
   vertex(x+l/2.4, xxo/1.8);
   vertex(x+l/1.8, xxo/1.8);
   vertex(x+l/1.4, xxo/1.6);
   vertex(x+l/1.2, xxo/1.6);
   vertex(x+l/1.1, xxo/2);
   vertex(x+l, xxo/2);

   endShape(); 
  
 
  popMatrix(); 
        
   }
   
      if (lina == 7){ 
    noStroke();
    fill(10,g+10);

   if (att == 60){

    pushMatrix();
    translate(25,15); 
     ellipse(x+dia, 1.9*dia , 2*dia, 1.7*dia);
    translate(20,10); 
     ellipse(x+dia, 1.9*dia , 1.5*dia, 1.3*dia);
    translate(15,10); 
     ellipse(x+dia, 1.9*dia , 1*dia, 0.9*dia);
    translate(15, 10); 
     ellipse(x+dia, 1.9*dia , 0.5*dia, 0.45*dia);
    popMatrix();
  
  
   }else if (att == 48){

    pushMatrix();
    translate(25,-15); 
    ellipse(x+dia, kassiHeight - (1.9*dia) , 2*dia, 1.7*dia);
    translate(20,-10); 
    ellipse(x+dia, kassiHeight - (1.9*dia) , 1.5*dia, 1.3*dia);
    translate(15,-10); 
    ellipse(x+dia, kassiHeight - (1.9*dia) , 1*dia, 0.9*dia);
    translate(15, -10); 
    ellipse(x+dia, kassiHeight - (1.9*dia) , 0.5*dia, 0.45*dia);
    popMatrix();
   
    }
    
   }
   
   
  
   
   
   
   noStroke(); 
    
   fill(0,100,50, g);
    
    
   if(mynd == 1){
   text("3", x, height/3+dia); 
   text("2", x, height/3); 
   text("1", x, height/3-dia); 
   text("T", x, height/3-(dia*2)); 
   }
   if(mynd == 2){
   text("3", x, height/3+dia); 
   //text("2", x, height/3); 
   text("1", x, height/3-dia); 
   //text("T", x, height/3-(dia*2)); 
   }
    if(mynd == 3){
   text("3", x, height/3+dia); 
   text("2", x, height/3); 
   //text("1", x, height/3-dia); 
   text("T", x, height/3-(dia*2));  
   }
     if(mynd == 4){
   //text("3", x, height/3+dia); 
   text("2", x, height/3); 
   text("1", x, height/3-dia); 
   //text("T", x, height/3-(dia*2)); 
   }
   if(mynd == 5){
   text("3", x, height/3+dia); 
   //text("2", x, height/3); 
   //text("1", x, height/3-dia); 
   text("T", x, height/3-(dia*2)); 
   }
    if(mynd == 6){
   //text("3", x, height/3+dia); 
   text("2", x, height/3); 
   //text("1", x, height/3-dia); 
   //text("T", x, height/3-(dia*2));  
   }
     if(mynd == 7){
   //text("3", x, height/3+dia); 
   //text("2", x, height/3); 
   text("1", x, height/3-dia); 
   //text("T", x, height/3-(dia*2)); 
   }
   if(mynd == 8){
   //text("3", x, height/3+dia); 
   //text("2", x, height/3); 
   text("1", x, height/3-dia); 
   text("T", x, height/3-(dia*2)); 
   }
    if(mynd == 9){
   //text("3", x, height/3+dia); 
   text("2", x, height/3); 
   //text("1", x, height/3-dia); 
   text("T", x, height/3-(dia*2));  
   }
     if(mynd == 10){
   text("3", x, height/3+dia); 
   //text("2", x, height/3); 
   //text("1", x, height/3-dia); 
   //text("T", x, height/3-(dia*2)); 
   }
   if(mynd == 11){
   //text("3", x, height/3+dia); 
   text("2", x, height/3); 
   text("1", x, height/3-dia); 
   text("T", x, height/3-(dia*2)); 
   }
    if(mynd == 12){
   text("3", x, height/3+dia); 
   text("2", x, height/3); 
   //text("1", x, height/3-dia); 
   //text("T", x, height/3-(dia*2));  
   }
     if(mynd == 13){
   text("3", x, height/3+dia); 
   //text("2", x, height/3); 
   text("1", x, height/3-dia); 
   text("T", x, height/3-(dia*2)); 
   }
   if(mynd == 14){
   text("3", x, height/3+dia); 
   text("2", x, height/3); 
   text("1", x, height/3-dia); 
   //text("T", x, height/3-(dia*2)); 
   }

   
    
    
    
   x = x - box_speed;
    

    
    
    

 }

}

