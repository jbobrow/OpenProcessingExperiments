

void setup() 
{ size(800,800);
background(255); 
smooth();
}


void draw()
{
noStroke();
int a =abs(pmouseY-mouseY);


fill(random(200),random(200),random(200),random(200));
    
    ellipse(pmouseX, pmouseY, a, a);
    ellipse(pmouseY,pmouseX,a,a);
    ellipse(800-pmouseY,pmouseX,a,a);
    ellipse(800-pmouseX,pmouseY,a,a);
    ellipse(pmouseX,800-pmouseY,a,a);
    ellipse(pmouseY,800-pmouseX,a,a);
    ellipse(pmouseY+800-2*pmouseY,pmouseX+800-2*pmouseX,a,a);
    ellipse(pmouseX+800-2*pmouseX,pmouseY+800-2*pmouseY,a,a);
    
}
 
void mousePressed()
 { 
background(255);
}






