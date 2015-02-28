
void setup () {
size (800, 1000); 
smooth();

//black background, white face
strokeWeight (1); 
noStroke(); 

}

void draw(){
background (mouseY,mouseY,mouseY);
fill (1000-mouseY,1000-mouseY,1000-mouseY);

beginShape(); 
vertex(150,110); 
vertex(310,40); 
vertex(490,20); 
vertex(620,70); 
vertex(720,305); 
vertex(670,500); 
vertex(590,600); //1
vertex(580,630); 
vertex(567,650); 
vertex(564,830); 
vertex(530,940); 
vertex(460,870); 
vertex(390,760); 
vertex(370,760); //2
vertex(290,690); 
vertex(345,725); 
vertex(380,736); 
vertex(413,715); 
vertex(413,690); 
vertex(357,658); //3
vertex(361,647); 
vertex(395,650); 
vertex(440,639); 
vertex(455,619); //4
vertex(428,628); 
vertex(370,617); 
vertex(346,620); 
vertex(306,614); 
vertex(312,600); //5
vertex(379,560); 
vertex(396,563); 
vertex(413,560); 
vertex(430,566); 
vertex(418,540); 
vertex(374,530); 
vertex(349,535); //6
vertex(318,505); 
vertex(280,563); 
vertex(296,498); 
vertex(330,439); 
vertex(323,482); 
vertex(351,486); //7
vertex(375,474); 
vertex(395,471); 
vertex(411,461); 
vertex(415,435); //8
vertex(400,407); 
vertex(396,337); 
vertex(375,341); 
vertex(360,360); 
vertex(353,327); 
vertex(275,321); //9
vertex(225,360); 
vertex(204,420); 
vertex(228,590); 
vertex(160,504); //10
vertex(106,300); 
vertex(150,110); 
endShape();

beginShape(); 
vertex(280,736); 
vertex(260,690); 
vertex(260,850); 
endShape();

beginShape(); 
vertex(543,940); 
vertex(575,840); 
vertex(635,910); 
vertex(645,940);
endShape();


fill (222, 0, 0);  
ellipse (292, 380, 5, 70);
ellipse (292, 380, 70, 5);
}
                
                
