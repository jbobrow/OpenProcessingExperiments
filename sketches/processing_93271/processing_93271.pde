
size(100,100);
background(255);
smooth();
noStroke();

int x = 10;
int y = 10;

//FOUR TRIANGLES
fill(99,178,227);
triangle(x+30, y+80, x+40, y+70, x+50, y+80);    
triangle(x+30, y, x+50, y, x+40, y+10);          
triangle(x, y+30, x+10, y+40, x, y+50);          
triangle(x+80, y+30, x+70, y+40, x+80, y+50);   

//

//FOUR SQUARES
fill(99,178,227);
rect(x, y, x, y);        
rect(x+70, y, x, y);     
rect(x, y+70, x, y);   
rect(x+70, y+70, x, y);  

//

//QUAD SHAPES
//top LEFT
fill(99,178,227);                                       
quad(x+10, y+30, x+30, y+30, x+40, y+40, x+20, y+40);   
quad(x+30, y+10, x+40, y+20, x+40, y+40, x+30, y+30);  

fill(177,211,240);                                       
quad(x, y+20, x+20, y+20, x+30, y+30, x+10, y+30);      
quad(x+20, y, x+30, y+10, x+30, y+30, x+20, y+20);     


//bottom LEFT
fill(177,211,240);                                      
quad(x+20, y+40, x+40, y+40, x+30, y+50, x+10, y+50);    
quad(x+40, y+40, x+40, y+60, x+30, y+70, x+30, y+50);    

fill(99,178,227);                                        
quad(x+10, y+50, x+30, y+50, x+20, y+60, x, y+60);      
quad(x+30, y+50, x+30, y+70, x+20, y+80, x+20, y+60);   



//top RIGHT
fill(177,211,240);                                        
quad(x+40, y+20, x+50, y+10, x+50, y+30, x+40, y+40);     
quad(x+50, y+30, x+70, y+30, x+60, y+40, x+40, x+40);     

fill(99,178,227);                                         
quad(x+50, y+10, x+60, y, x+60, y+20, x+50, y+30);        
quad(x+60, y+20, x+80, y+20, x+70, y+30, x+50, y+30);     

//bottom RIGHT
fill(99,178,227);                                        
quad(x+40, y+40, x+50, y+50, x+50, y+70, x+40, y+60);    
quad(x+40, y+40, x+60, y+40, x+70, y+50, x+50, y+50);    

fill(177,211,240);                                      
quad(x+50, y+50, x+60, y+60, x+60, y+80, x+50, y+70);    
quad(x+50, y+50, x+70, y+50, x+80, y+60, x+60, y+60);    

//

//BLUE OUTER STROKES
stroke(99,178,227);
strokeWeight(1);
strokeCap(SQUARE);

line(x+10, y+10, x+70, y+70);
line(x+70, y+10, x+10, y+70);
line(x+40, y+10, x+40, y+70);
line(x+10, y+40, x+70, y+40);

//WHITE INNER STROKES
stroke(255);
strokeWeight(1);
strokeCap(SQUARE);
line(x+20, y+20, x+60, y+60);
line(x+60, y+20, x+20, y+60);
line(x+40, y+20, x+40, y+60);
line(x+20, y+40, x+60, y+40);

//

//CENTRE SQUARE
noStroke();
smooth();
fill(255);
quad(x+40, y+30, x+50, y+40, x+40, y+50, x+30, y+40);

//

