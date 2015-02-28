
int x=500;
int y=550;
size(x,y);
strokeWeight(15);

fill(227,0,0);
rect(0,0,x,y);         //kirmizi fon

fill(255);
rect(0,0,125,330);        //top left white 
rect(0,150,125,450);      //left second white
rect(0,400,x,150);      //all bottom white 
fill(0,0,255);          
rect(0,400,125,150);      //bottom left blue 
fill(255);
rect(x-75,400,75,150);  //bottom right all white
fill(222,227,0);
rect(x-75,475,75,75);   //bottom right yellow







