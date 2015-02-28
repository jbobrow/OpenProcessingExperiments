




void setup(){  
    
  smooth();  


size(800,600); //Projenin boyutunu verdim. 
  background(255); // sayfanın rengi 
   fill(255); 
 ellipse(300,200,150,80); //gözlerin dış ovali. 
ellipse(500,200,150,80); 
 
fill(33,180,103);// göz rengi. 
ellipse(300,200,50,50);// Göz tabakası yuvarlağı. 
ellipse(500,200,50,50); 
fill(3); 
ellipse(300,200,20,20); //Gözlerin merceği. 
ellipse(500,200,20,20); 


} 
  
     void draw () { 
	      stroke(255);     //çizgi     
	      strokeWeight(1);  //çizgi kalınlığı
	      beginShape(TRIANGLES);  //ucgen cizyor
	      vertex(150,80); 
	      vertex(mouseX, mouseY);  // mouse yonu
	      vertex(150,80);  
	      endShape();  
	      strokeWeight(2);  // 
	      line(96,150,112,150); 
	      line(150,150,166,150); 
	     } 


 
 

 
   


