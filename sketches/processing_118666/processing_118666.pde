
size(500,500);
rectMode(CENTER);

void redraw(x,y,l){
       rect(x,y,l,l);
    ellipse(x,y,l,l);
}

 for(i=0; i<10; i++){
     x= random(10,400);
     y= random(10,400);
     l= random(10,50);

redraw(x,y,l);
}
