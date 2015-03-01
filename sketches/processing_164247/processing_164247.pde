
{
  size (600,800);
  background (#FF46C2);
  smooth ();
    {
      //CABELL_1
      fill(0);
      beginShape();
      vertex(120,250);
      bezierVertex(250,290,300,300,480,250);
      bezierVertex(465,480,150,480,120,250);
      endShape();
      //CARA
      strokeWeight (8);
      fill (#FFF2D1);
      ellipse (300,300,300,245);
      strokeWeight (4);
      arc(300,360,40,55,0,PI);
      noFill();
        //ULLS
      fill(255);
      ellipse (217,300,130,145);
      ellipse (382,300,130,145);
      strokeWeight(0);
      fill (#75C408);
      ellipse (223,300,115,115);
      ellipse (377,300,115,115);
      fill(0);
      ellipse (225,297,86,86);
      ellipse (375,297,86,86);
      fill(255);
      ellipse (229,293,36,36);
      ellipse (370,293,36,36);
        //CABELL_2
      fill(0);
      arc(300,265,310,190,PI,TWO_PI);
      fill(#FFF2D1);
      stroke(#FFF2D1);
      triangle(283,265,300,200,317,265);
      
        //COS
      stroke(0); 
      fill(#75C408);
      strokeWeight(5);
      quad(257,500,357,500,362,530,252,530);
      fill(#75C408);
      strokeWeight(5);
      fill(0);
      quad(265,450,348,450,357,500,257,500);
      fill(#75C408);
      quad(270,420,341,420,348,450,265,450);
      fill(#FFF2D1);
      bezier(270,420,210,440,240,485,257,490);
      bezier(341,420,401,440,371,485,357,490);
    
        //PEUS
      strokeWeight(5);
      fill(255);
      quad(252,530,305,527,305,580,252,577);
      quad(305,527,362,530,362,577,305,580);
      fill(0);
      quad(252,577,305,580,305,600,255,600);
      quad(305,580,362,577,360,600,305,600);
      fill(0);
      arc(280,600,50,50,0,PI);
      arc(335,600,50,50,0,PI);
      fill(255);
      arc(280,585,40,40,0,PI);
      arc(335,585,40,40,0,PI);
      
     
  

      
    }
} 
