

float x = 0; 


float y = 0; 


float x2 = 0; 


float y2 = 0; 


float easing = 0.20; 


    


   


void setup()  


{ 


  size(500, 500); 


  noStroke(); 


} 


   


 void draw()  


{ 


  smooth(); 


  background(255,243,89); 


   


    


  


  


if (mousePressed) 


{     


  


  


  


    pushMatrix(); 


    fill(255); 


    stroke(0); 


    strokeWeight(5); 


    translate(150, 200); 


    ellipse(0, 0, 180, 180); 


    popMatrix(); 


      


  


  


  


    pushMatrix(); 


    translate(330, 200); 


    ellipse(0, 0, 180, 180); 


    popMatrix(); 


      


  


  


    fill(50,195,247); 


    stroke(0); 


    strokeWeight(5); 


    float mx = constrain(mouseX, 120, 180); 


    float my = constrain(mouseY, 200, 200); 


    x += (mx-x) * easing; 


    y += (my-y) * easing; 


    ellipse(x, y, 80, 80); 


  


  


  


   


    float mx2 = constrain(mouseX,300, 370); 


    float my2 = constrain(mouseY, 200, 200); 


    x2 += (mx2-x2) * easing; 


    y2 += (my2-y2) * easing; 


    ellipse(x2, y2, 80, 80); 


  


  


  


    fill(0); 


    stroke(0); 


    strokeWeight(5);    


    x += (mx-x) * easing; 


    y += (my-y) * easing; 


    ellipse(x, y,50, 50); 


  


  


  


    x2 += (mx2-x2) * easing; 


    y2 += (my2-y2) * easing; 


    ellipse(x2, y2, 50, 50); 


  


  


  


    stroke(0); 


    strokeWeight(5); 


    line(60,200,420,200); 


  


  


  


  


    noStroke(); 


    fill(255,243,89);  


    rect(50,100,500,100); 


        


  


    stroke(0); 


    strokeWeight(5); 


    bezier(150,400,150,400,350,400,350,420); 


    } 


      


    else 


    { 


  


  


   


    pushMatrix(); 


    fill(255); 


    stroke(0); 


    strokeWeight(5); 


    translate(150, 200); 


    ellipse(0, 0, 180, 180); 


    popMatrix(); 


  


  


  


   


    pushMatrix(); 


    translate(330, 200); 


    ellipse(0, 0, 180, 180); 


    popMatrix(); 


  


  


  


   


    fill(50,195,247); 


    stroke(0); 


    strokeWeight(5); 


    float mx = constrain(mouseX, 120, 180); 


    float my = constrain(mouseY, 180, 220); 


    x += (mx-x) * easing; 


    y += (my-y) * easing; 


    ellipse(x, y, 80, 80); 


  


  


  


   


    float mx2 = constrain(mouseX,300, 370); 


    float my2 = constrain(mouseY, 180, 220); 


    x2 += (mx2-x2) * easing; 


    y2 += (my2-y2) * easing; 


      ellipse(x2, y2, 80, 80); 


  


  


   


    fill(0); 


    stroke(0); 


    strokeWeight(5); 


    x += (mx-x) * easing; 


    y += (my-y) * easing; 


    ellipse(x, y,50, 50); 


  


  


  


   


    x2 += (mx2-x2) * easing; 


    y2 += (my2-y2) * easing; 


    ellipse(x2, y2, 50, 50); 


      


     


  


    stroke(0); 


    strokeWeight(5); 


    bezier(150,400,150,400,350,400,350,400); 


    } 


    } 

