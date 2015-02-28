
void setup(){
    size(400,200);    
    //strokeWeight(.1);
    noStroke();
}
 
int row = 0;
int col = 0;
void draw(){
    noFill();
    
    Pyramid p = new Pyramid();
    p.Draw(row,col);
    
    //set the limits of camvas limits
        row++;
        if((row*20) > width){ 
                row = 0;
                col++;
        }        
        if((col*20) > height){ 
                col=0;
                noLoop();//end the draw
        }
}
 
//mouse events
void mousePressed(){
        background(0);
        row = 0;
        col = 0;
        loop();
}
 
/*custom classes*/
class Pyramid{
 //my pyramid is composed by 4 triangles        
 Triangle t1 = new Triangle(0, 0, 0, 20, 10, 10);
 Triangle t2 = new Triangle(0, 20, 10, 10, 20, 20);
 Triangle t3 = new Triangle(20, 20, 10, 10, 20, 0);
 Triangle t4 = new Triangle(0, 0, 20, 0, 10, 10);
 
 void Draw(int xPosition, int yPosition){
        t1.Draw(xPosition, yPosition);
        t2.Draw(xPosition, yPosition);
        t3.Draw(xPosition, yPosition);
        t4.Draw(xPosition, yPosition);       
 }
}
 
class Triangle{
        int x1;        int y1;        
        int x2;        int y2;        
        int x3;        int y3;
        
        Triangle(int px1, int py1, int px2, int py2, int px3, int py3)
        {
                //convert zeros to ones, because 0*n == 0
                x1 = (px1==0 ? 1 : px1); 
                y1 = (py1==0 ? 1 : py1); 
                x2 = (px2==0 ? 1 : px2); 
                y2 = (py2==0 ? 1 : py2); 
                x3 = (px3==0 ? 1 : px3); 
                y3 = (py3==0 ? 1 : py3); 
        }
        
        //move to the position
        void Draw(int xPosition, int yPosition){
                //fix the position with the tiangle size
                xPosition = (xPosition * 19);
                yPosition = (yPosition * 19);
                
                fill(random(255), 0, random(255));
                triangle(
                        x1+xPosition, y1+yPosition, 
                        x2+xPosition, y2+yPosition, 
                        x3+xPosition, y3+yPosition);
        }
}
