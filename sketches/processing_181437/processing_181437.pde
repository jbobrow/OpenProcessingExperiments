
size(800,200);
int x=width/16;
int y=height;

noStroke();
rectMode(CORNER);
fill(244,164,96); rect(0,0,x,y); fill(255,97,3); rect(x,0,x,y); 
fill(244,164,96); rect(2*x,0,x,y); fill(255,97,3); rect(3*x,0,x,y); 
fill(244,164,96); rect(4*x,0,x,y); fill(255,97,3); rect(5*x,0,x,y); 
fill(244,164,96); rect(6*x,0,x,y); fill(255,97,3); rect(7*x,0,x,y); 
fill(244,164,96); rect(8*x,0,x,y); fill(255,97,3); rect(9*x,0,x,y); 
fill(244,164,96); rect(10*x,0,x,y); fill(255,97,3); rect(11*x,0,x,y); 
fill(244,164,96); rect(12*x,0,x,y); fill(255,97,3); rect(13*x,0,x,y); 
fill(244,164,96); rect(14*x,0,x,y); fill(255,97,3); rect(15*x,0,x,y); 
fill(244,164,96); rect(16*x,0,x,y);

fill(0); noStroke();

//1
    triangle(0,height,width/16,7*height/8,width/8,height);
        rectMode(CORNER); rect(width/16,7*height/8,width/16,height/8);
//2
    triangle(2*width/16,7*height/8,3*width/16,6*height/8,width/4,7*height/8);
        rectMode(CORNER); rect(width/8,7*height/8,7*width/8,height/8);
//3
    triangle(4*width/16,6*height/8,5*width/16,5*height/8,5*width/16,3*height/4);
        rectMode(CORNER); rect(3*width/16,6*height/8,7*width/8,height/8);
//4
    triangle(6*width/16,5*height/8,7*width/16,5*height/8,7*width/16,4*height/8);
        rectMode(CORNER);rect(5*width/16,5*height/8,7*width/8,height/8);
//5
    triangle(8*width/16,4*height/8,9*width/16,4*height/8,9*width/16,3*height/8);
        rectMode(CORNER);rect(7*width/16,4*height/8,7*width/8,height/8);
//6
     triangle(10*width/16,3*height/8,11*width/16,3*height/8,11*width/16,2*height/8);
         rectMode(CORNER);rect(9*width/16,3*height/8,7*width/8,height/8);  
//7
     triangle(12*width/16,2*height/8,13*width/16,2*height/8,13*width/16,height/8); 
         rectMode(CORNER);rect(11*width/16,2*height/8,7*width/8,height/8);
//8
     triangle(14*width/16,height/8,15*width/16,height/8,15*width/16,0);
         rectMode(CORNER);rect(13*width/16,height/8,7*width/8,height/8);
//9
     rectMode(CORNER);rect(15*width/16,0,7*width/8,height/8); 
     
fill(244,164,96); stroke(255,97,3); strokeWeight(height/10);
ellipseMode(CENTER); ellipse(7*width/8,5*height/8,width/8,height/2);
