
void setup(){
size(800,800);

}
void draw(){
background(120,150,20);
stroke(150,120,100);
fill(80,80,10);

 if(mousePressed){


 

//ellipse(mouseX-150,mouseY-300,300,300);
//ellipse(150,300,290,290);
//ellipse(150,300,280,280);

//hairs
ellipse(mouseX-125,mouseY+60,60,50);
ellipse(mouseX-125,mouseY+30,20,20);
ellipse(mouseX-125,mouseY+20,10,10);

ellipse(mouseX-175,mouseY+60,60,50);
ellipse(mouseX-175,mouseY+30,20,20);
ellipse(mouseX-175,mouseY+20,10,10);

ellipse(mouseX-100,mouseY+70,60,50);
ellipse(mouseX-90,mouseY+40,40,30);
ellipse(mouseX-100,mouseY+20,25,30);


ellipse(mouseX-200,mouseY+70,60,50);
ellipse(mouseX-210,mouseY+40,40,30);
ellipse(mouseX-200,mouseY+20,25,30);

ellipse(mouseX-150,mouseY+60,60,50);
ellipse(mouseX-150,mouseY+30,40,30);
ellipse(mouseX-150,mouseY+10,25,20);





//ears
ellipse(mouseX-60,mouseY+150,20,60);
ellipse(mouseX-240,mouseY+150,20,60);



//face
ellipse(mouseX-150,mouseY+150,180,200);

//eyes
fill(255);

ellipse(mouseX-100,mouseY+100,10,10);
ellipse(mouseX-150,mouseY+100,10,10);

//eyes
fill(0);
ellipse(mouseX-100,mouseY+100,5,10);
ellipse(mouseX-150,mouseY+100,5,10);

//nose
fill(80,80,10);
ellipse(mouseX-125,mouseY+130,25,30);

//nose holes
fill(0);
ellipse(mouseX-120,mouseY+130,5,10);
ellipse(mouseX-130,mouseY+130,5,10);


//mouth
fill(80,20,20);
ellipse(mouseX-150,mouseY+205,50,20);
//ellipse(150,200,50,10);

//teeth
fill(255);
ellipse(mouseX-135,mouseY+205,5,10);
ellipse(mouseX-139,mouseY+205,5,10);
ellipse(mouseX-143,mouseY+205,5,10);
ellipse(mouseX-147,mouseY+205,5,10);
ellipse(mouseX-151,mouseY+205,5,10);
ellipse(mouseX-155,mouseY+205,5,10);
ellipse(mouseX-159,mouseY+205,5,10);
ellipse(mouseX-163,mouseY+205,5,10);


//mouth
fill(80,20,20);
ellipse(mouseX-150,mouseY+200,50,10);

}

 
else{
  background(80,80,10);
   fill(120,150,20);
//hairs
ellipse(mouseX+125,mouseY+60,60,50);
ellipse(mouseX+125,mouseY+30,20,20);
ellipse(mouseX+125,mouseY+20,10,10);

ellipse(mouseX+175,mouseY+60,60,50);
ellipse(mouseX+175,mouseY+30,20,20);
ellipse(mouseX+175,mouseY+20,10,10);

ellipse(mouseX+100,mouseY+70,60,50);
ellipse(mouseX+90,mouseY+40,40,30);
ellipse(mouseX+100,mouseY+20,25,30);


ellipse(mouseX+200,mouseY+70,60,50);
ellipse(mouseX+210,mouseY+40,40,30);
ellipse(mouseX+200,mouseY+20,25,30);

ellipse(mouseX+150,mouseY+60,60,50);
ellipse(mouseX+150,mouseY+30,40,30);
ellipse(mouseX+150,mouseY+10,25,20);





//ears
ellipse(mouseX+60,mouseY+150,20,60);
ellipse(mouseX+240,mouseY+150,20,60);


//face
ellipse(mouseX+150,mouseY+150,180,200);

//eyes
fill(255);

ellipse(mouseX+100,mouseY+100,10,10);
ellipse(mouseX+150,mouseY+100,10,10);

//eyes
fill(0);
ellipse(mouseX+100,mouseY+100,5,10);
ellipse(mouseX+150,mouseY+100,5,10);

//nose
fill(120,150,20);
ellipse(mouseX+125,mouseY+130,25,30);

//nose holes
fill(0);
ellipse(mouseX+120,mouseY+130,5,10);
ellipse(mouseX+130,mouseY+130,5,10);


//mouth
fill(80,20,20);
ellipse(mouseX+150,mouseY+205,60,60);
//ellipse(150,200,50,10);

/*teeth
fill(255);
ellipse(mouseX+135,mouseY+205,5,10);
ellipse(mouseX+139,mouseY+205,5,10);
ellipse(mouseX+143,mouseY+205,5,10);
ellipse(mouseX+147,mouseY+205,5,10);
ellipse(mouseX+151,mouseY+205,5,10);
ellipse(mouseX+155,mouseY+205,5,10);
ellipse(mouseX+159,mouseY+205,5,10);
ellipse(mouseX+163,mouseY+205,5,10);


//mouth
fill(80,20,20);
ellipse(mouseX+150,mouseY+200,50,10);
*/

//tougue
fill(50,10,10);
ellipse(mouseX+150,mouseY+205,60,20);
  }
 
}





