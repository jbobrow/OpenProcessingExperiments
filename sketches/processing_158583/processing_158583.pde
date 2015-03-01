
float d1,d2,d3,d4,d5,d6;
float c1,c2,c3;
/**float[] dSS = new float[6];
float[] cSS = new float[3];*/

void setup(){
    size(600,600);
    stroke(123);
    background(0);
 }
void draw(){
    if(mousePressed == true){
        d1 = random(-50,50);
        d2 = random(-50,50);
        d3 = random(-50,50);
        d4 = random(-50,50);
        d5 = random(-50,50);
        d6 = random(-50,50);
        c1 = random(0,255);
        c2 = random(0,255);
        c3 = random(0,255);
        triangle(mouseX + d1, mouseY + d2, mouseX + d3, mouseY + d4, mouseX - d5, mouseY + d6);
        fill(c1,c2,c3);
        dSS = random(-50,50);
        cSS = random(0,255);
        /**for(int i = 1, i < 7, i += 1){
            dSS[i] = random(-50,50);
        }
        for(int j = 1, i < 4, i += 1){
            cSS[j] = random(0,255);
        }
        triangle(mouseX + dSS[1], mouseY + dSS[2], mouseX + dSS[3], mouseY + dSS[4], mouseX - dSS[5], mouseY + dSS[6]);
        
        fill(cSS[1],cSS[2],cSS[3]);*/
    }
}
