
size(400,400);


for(float e=500; e>1; e=e-10 )
for(float a=300; a>1; a=a-10 )

{

strokeWeight(e*0.01);
ellipse(200,200,e,e);

  
strokeWeight(a*0.01);
ellipse(200,200,a,a);

strokeWeight(a*0.01);
ellipse(0,300,a,a);

strokeWeight(a*0.01);
ellipse(300,0,a,a);

strokeWeight(a*0.01);
ellipse(30,30,a,a);

strokeWeight(a*0.01);
ellipse(420,240,a,a);

strokeWeight(a*0.01);
ellipse(230,420,a,a);


fill(random(255),random(255),random(255));

}

                                            
