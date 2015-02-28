

int currentBrush = 1;

void setup() {    
    size(500, 500); 
 
} 
 
void draw() {  
        if (keyPressed) {
            
            if (key == '1') {
                currentBrush = 1;
            }
            if (key == '2') {
                currentBrush = 2;
            }
            if (key == '3') {
                currentBrush = 3;
            }
            
        } 
    
    if (mousePressed == true)
    {
        
        
        if (mouseButton == LEFT) 
        {
            if (currentBrush == 1) 
            {
            pushMatrix();
            translate(mouseX, mouseY);
            fill(0);

            ellipse(0, 0, 20, 20);
            popMatrix();  
            
            }
            if (currentBrush == 2) 
            {
            pushMatrix();
            translate(mouseX, mouseY);
            fill(random(255), random(255), random(255));

            quad(random(100), random(100), random(100), random(100), random(100), random(100), random(100), random(100));
            popMatrix();  
            }
            
        }
    
       

    }
}


