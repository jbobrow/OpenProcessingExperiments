
//Stolen from de Stijl: an homage to Mondrian in an infinite number of (mostly poor) compositions. 
//I wanted to try my hand at loops and de Stljl seemed to fit the bill. 
//As a newish programmer, I am happier with the technical aspects than the aesthetic, but I have learned a lot.

//Globals 
color[] palette = {#000000, #E4F7F7, #0500EF, #BF0000, #FFF700};
color primes[] = subset(palette, 2);

//setup()
void setup() {
     size(800, 600);    
     background(palette[2]);
     frameRate(0.5);  
     stroke(palette[0]);
     strokeWeight(6); 
     textAlign(CENTER);  
     textSize(56);
     text("Stolen from de Stijl", width/2, height/2);
}

//draw()
void draw() {
    //repeatedly call function to draw Mondrian-style compositions
    background(#FFFFFF); //reset background before each iteration
    drawMondrian();   
    }
   
void drawMondrian() {
    //assign random initial horizontal and vertical line coordinates
    float posX = random(25, 100);
    float posY = random(25, 100);    
    //create empty arrays to store line coordinates
    float[] posXs = {};
    float[] posYs = {};
     
    //draw vertical lines
    while (posX < width) {
        //append posX values to posXs array as they are created. (Needed to create rect object later.)
        posXs = append(posXs, posX); 
        line(posX, 0, posX, height);
        //narrower distance beween lines towards right-hand side of canvas
        if (width * 0.60 < posX && posX < width * 0.95) {
            posX += random(25, 100); 
        } else {
            posX += random(100, 175);
        }   
    }
    int lenXs = posXs.length;    
    
    //draw horizontal lines    
    while (posY < height) {
        //append posY values to posYs array as they are created. (Needed to create rect object later.)
        posYs = append(posYs, posY);
        //0.5 probability that horizontal line will not stretch across entire width of canvas
        if (random(0,2) < 1) {
            int start = int(random(1, lenXs/2));
            int end = int(random(lenXs/2, lenXs - 1));     
            line(posXs[start], posY, posXs[end], posY);
        } else {
            line(0, posY, width, posY);
        }
        //narrower distance beween lines in centre of canvas
        if (width * 0.40 < posY && posY < width * 0.60) {
            posY += random(25, 75); 
        } else {
            posY += random(75, 150);
        }   
    }
    int lenYs = posYs.length;
    
    //draw and fill rectangles     
    int indX;
    int indY;
    float rectWidth;
    float rectHeight;
    //draw up to 10 rectangles 
    for (int count = 0; count < 10; count++) {
        indX = int(random(0, lenXs));
        posX = posXs[indX];
        if (indX >= lenXs - 1) {
            //+ 10 ensures that right-hand border is not drawn on canvas
            rectWidth = width  + 10 - posXs[indX]; 
        } else {     
            rectWidth = posXs[indX + 1] - posXs[indX];
        }      
       indY = int(random(0, lenYs));
       posY = posYs[indY];
       if (indY >= lenYs - 1) {
           //+10 ensures that bottom border is not drawn on canvas
           rectHeight = height + 10 - posYs[indY]; 
       } else {      
           rectHeight = posYs[indY + 1] - posYs[indY];
       }
       //draw and fill rectangle 
       //if rectangle has width > 100 or height > 100 fill with a prime colour
       if (rectHeight > 100.0 || rectWidth > 100.0) {
           fill(primes[int(random(0,3))]);
       } else {
           fill(palette[int(random(0,5))]);
       }               
       rect(posX, posY, rectWidth, rectHeight);
    }  
}



 


