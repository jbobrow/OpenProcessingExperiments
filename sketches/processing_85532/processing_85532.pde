
size(500,500);
 


stroke(0,0,0);
 int N;
N=25;
ellipse(N,height/2,50,50);
ellipse(N+50,height/2,50,50);
ellipse(N+100,height/2,50,50);
ellipse(N+150,height/2,50,50);
ellipse(N+200,height/2,50,50);
ellipse(N+250,height/2,50,50);
ellipse(N+300,height/2,50,50);
ellipse(N+350,height/2,50,50);
ellipse(N+400,height/2,50,50);
ellipse(N+450,height/2,50,50);


/* donc là, fonction FOR où on défini une boucle où on donne un départ,
une arrivée et tant que c'est possible, l'opération  de la boucle se répète.*/


//for(int i=1; i<=-10; i=i-1) 
//translate(0,0,i*-15);
for (int z = 2; z <=-20; z = z -1) 
translate(mouseX, mouseY, z);
{  
    for (int y=25; y<=475; y=y+55 ) 
    {
      for (int x=25; x<=475; x=x+55 )
      {
        noFill();
      ellipse(y,x,50,50);
      fill(0,0,0);
      rect(y,x,20,20,6,20,40,3);
    }
  }
}
