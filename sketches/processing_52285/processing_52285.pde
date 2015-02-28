
//once upon a time...
void setup()
{  
 size (250, 250);  

 noStroke();
 fill(#BCBCBC);
 rect(0,0,width,height); // canvas
}

void draw()
{
  //under
 layer_1();
 layer_2();
 layer_3();
 //basic
 layer();
 layer1();
 layer2();
 layer3();
 layer4();
 //block outs
 layer5(); 
 layer6();
 layer7();
 layer8();
 layer9();

}

//UNDER - black stretches

void layer_1()
{noStroke();
 fill(#000000);
ellipse(80,80,82,82); //top left
}

void layer_2()
{noStroke();
 fill(#000000);
ellipse(162,170,82,82); // bottom right
}

void layer_3()
{noStroke();
 fill(#000000);
ellipse(160,90,82,82); // bottom left
}



//


//BASIC 
void layer()
{ noStroke();
 fill(#FFB800);
ellipse(125,125,10,10); //center
}

void layer1()
{
 noStroke();
 fill(#000000);
ellipse(45,125,80,80); //black left
}



void layer2()
{ noStroke();
 fill(#000000);
ellipse(205,125,80,80); //black right
}


void layer3()
{ noStroke();
 fill(#000000);
ellipse(125,45,80,80); //black top
}


void layer4()
{ noStroke();
 fill(#000000);
ellipse(125,205,80,80); //black bottom
}


// Block outs
void layer5()
{noStroke();
 fill(#BCBCBC);
ellipse(125,125,82,82); //center
}


void layer6()
{noStroke();
 fill(#BCBCBC);
ellipse(206,206,82,82); //bottom right
}

void layer7()
{noStroke();
 fill(#BCBCBC);
ellipse(206,44,82,82); //top right
}

void layer8()
{noStroke();
 fill(#BCBCBC);
ellipse(44,44,82,82); //top left
}

void layer9()
{noStroke();
 fill(#BCBCBC);
ellipse(44,206,82,82); //bottom left
}


//the end

