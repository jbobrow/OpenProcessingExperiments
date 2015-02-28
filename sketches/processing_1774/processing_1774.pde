
public class kassi{

 float x = 0;
 float box_speed = 16;
 float xxx;
 float xxo;
 float xxu;
 int l = 100;
 int g=150;
 int kassiHeight=220;

 void kassi(){
   x = width / 4;

 }

 void reset(float timategund, int gegnumskin){
   x = (width / 4);
   l = (int)((float)box_speed * (float) timategund / (float)frameRate * .625);
   
  

   
   
   
 }

 void draw(int litur, int att, int lina){
   noStroke();

   fill(litur,g);
   rect((int)x, dia, l, kassiHeight - (2 * dia));

     fill(10,10,10,g+30);


  if((att <= uppi) && (att > mid )) {
   //  line(x, 1.5 * dia, x + l, kassiHeight - (1.5 * dia));
     ellipse(x+dia, 1.9*dia , 2*dia, 1.7*dia);
     xxx = dia*2;
     xxo = kassiHeight - (dia*2.3);
     xxu = -20;
       g = 150;
  }else if((att >= nidri) && (att < mid)){
 //    line(x, kassiHeight - 1.5 * dia, x + l, (1.5 * dia));
     ellipse(x+dia, kassiHeight - (1.9*dia) , 2*dia, 1.7*dia);
     xxx = kassiHeight - (dia*1.9); 
     xxo = kassiHeight - (dia*1.3);
     xxu = 75;
       g = 150;    
 }else if (att == mid){
    ellipse(x+dia, kassiHeight/2.2, 2*dia, 1.7*dia);
     xxx = kassiHeight/2.2; 
     xxo = kassiHeight/2;
     xxu = 115;
       g = 150; 
 }
   
    
    
   noFill(); 
   strokeWeight(5);
   stroke(20,20,20,g);
    
    
    //pistlaust
         if (att == pitslaustu){
       point(x+dia, xxx+dia); 
       }
       else if (att == pitslaustn){
       point(x+dia, xxx-dia); 
       }
  
   

      //pitsad
       if (att == pitsadu){
         point(x+dia, xxx+dia*1.5); 
         line (x+dia/2, xxx+dia, x+dia*1.5, xxx+dia);
       }
         else if (att == pitsadn){
         point(x+dia, xxx-dia*1.5); 
         line (x+dia/2, xxx-dia, x+dia*1.5, xxx-dia);
       } 

   
      //aherzlu
       if(att == aherzluu){
         xxx=xxx+dia;
   line(x+dia*0.5, xxx, x+dia, xxx+dia/2);
   line(x+dia, xxx+dia/2, x+dia*1.5, xxx);
       }
       else if (att == aherzlun){
         xxx=xxx-dia;
   line(x+dia*0.5, xxx, x+dia, xxx-dia/2);
   line(x+dia, xxx-dia/2, x+dia*1.5, xxx);
       }
       
   
  
  
   //glitsky
      if ((att == glitskyu) || (att == glitskyn)){ 
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
   
   
   
   
   
   //laaa
      if ((att == laaau) || (att == laaan)){ 
        strokeWeight(5);
        line(x, xxx, x+l, xxx);  
   }
   
   
   
      if ((att == brooou) || (att == brooon)){ 
        
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
   


//pjuuu
   // noStroke();
    stroke(10,g+10);
 
   if (att == pjuuuu){


  
    beginShape();
   curveVertex(x-dia, xxo/2.9);
   curveVertex(x, xxo/2.9);
   curveVertex(x+l/6, xxo/2.9);
   curveVertex(x+l/5.5, xxo/2.8);
   curveVertex(x+l/5, xxo/2.6);
   curveVertex(x+l/4.5, xxo/2.4);
   curveVertex(x+l/4, xxo/2.2);
   curveVertex(x+l/3.5, xxo/2);
   curveVertex(x+l/3, xxo/1.9);
   curveVertex(x+l/2.5, xxo/1.7);
   curveVertex(x+l/2, xxo/1.5);
   curveVertex(x+l/1.5, xxo/1.3);
   curveVertex(x+l/1.3, xxo/1.1);
   curveVertex(x+l/1.1, xxo);
   curveVertex(x+l, xxo+dia);
   curveVertex(x+l+dia, xxo+(dia*2));
   endShape(); 
 
 
   }else if (att == pjuuun){

      beginShape();
   curveVertex(x-dia, xxo/1.08);
   curveVertex(x, xxo/1.08);
   curveVertex(x+l/6, xxo/1.1);
   curveVertex(x+l/5.5, xxo/1.4);
   curveVertex(x+l/5, xxo/1.9);
   curveVertex(x+l/4.5, xxo/2.1);
   curveVertex(x+l/4, xxo/2.4);
   curveVertex(x+l/3.5, xxo/2.7);
   curveVertex(x+l/3, xxo/3);
   curveVertex(x+l/2.5, xxo/3.3);
   curveVertex(x+l/2, xxo/3.7);
   curveVertex(x+l/1.5, xxo/4);
   curveVertex(x+l/1.3, xxo/4.5);
   curveVertex(x+l/1.1, xxo/5);
   curveVertex(x+l, xxo/6);
   curveVertex(x+l+dia, xxo/7);
   endShape(); 
   
    }
    
   

   x = x - box_speed;
  

 }

}

