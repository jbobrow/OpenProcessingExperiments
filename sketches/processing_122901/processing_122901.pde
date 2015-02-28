
//Simulacion de rapido y furioso con turbo
//







var xtree1 = 1, xtree2 = 1, xtree3 = 1, speed = 1, throttle = 97, road1=10, road2=130, road3=250, road4=370, button=0, c1=105, c2=100, c3=250, face = 0;

var draw = function() {
    if(button===0){
        cursor();
        //Sky
        fill(100, 200, 250, 200);
        rect(-1,-1,402,402);
        
        //Ground
        noStroke();
        fill(5, 200, 0, 200);
        rect(-1,203,402,202);
        
        
        //Road
        fill(50, 50, 50);
        rect(-1,250,400,50);
        
        //Car
        if(speed>70){
            fill(255, 255, 0);
            ellipse(170,275,100,14);
            fill(255, 0, 0);
            ellipse(170,276,80,10);
            fill(255, 255, 255);
            rect(184,101,211,50,20);
            triangle(288,150,250,150,220,190);
            fill(252, 0, 0);
            textSize(20);
            text("Nos vamos a mataaar!!",183,130);
            textSize(12);
        }else if(speed<20){
            fill(255, 255, 255);
            rect(151,100,244,50,20);
            triangle(237,150,190,150,190,190);
            fill(0, 0, 0);
            textSize(20);
            fill(255, 0, 0);
            text("Pisele!!",179,130);
            textSize(12);
        }
        fill(100, 100, 100);
        ellipse(184,283,15,15);
        ellipse(217,283,15,15);
        fill(c1, c2, c3);
        rect(170,267,60,15);
        rect(180,255,40,15);
        fill(250, 250, 250);
        rect(200,257,15,10);
        stroke(209, 125, 57);
        point(205,263);
        noStroke();
        
        //Some trees
        var tree = getImage("cute/TreeTall");
        image(tree, xtree1, 180, 40, 50);
        image(tree, xtree2, 189, 50, 65);
        image(tree, xtree3, 260, 70, 95);
        
        //Car color changing button
        fill(129, 109, 242);
        rect(360, 50, 30, 30);
        fill(5, 0, 0);
        rect(365, 65, 20, 8);
        rect(370, 60, 10, 5);
        ellipse(370, 73, 5, 5);
        ellipse(380, 73, 5, 5);
        if(mouseIsPressed && mouseX>360 && mouseX<390 && mouseY>50 && mouseY<80){
            c1=random(0,255);
            c2=random(0,255);
            c3=random(0,255);
        }
        
        //Button to change scene
        fill(205, 200, 200);
        rect(360, 10, 30, 30);
        stroke(0, 0, 0);
        point(375, 20);
        strokeWeight(2);
        arc(371, 30, 10, 10, 3, 5);
        arc(379, 30, 10, 10, 4.5, 6.5);
        noStroke();
        fill(0, 0, 0);
        triangle(375, 20, 370, 35, 380, 35);
        if(mouseIsPressed && mouseX>360 && mouseX<390 && mouseY>10 && mouseY<40){
            button=1;
        }
    }
    
    
    
    
    
    
    
    
    else{
        background(c1, c2, c3);
        fill(107, 250, 255);
        quad(200, 100, 350, 50, 350, 250, 200, 220);
        fill(25, 200, 20);
        quad(200, 180, 350, 180, 350, 250, 200, 220);
        fill(105, 100, 100);
        rect(-1,150,150,251);
        fill(0, 160, 90);
        triangle(90,170,10, 420,170,420);
        stroke(209, 162, 92);
        strokeWeight(100);
        point(90,170);
        noStroke();
        
        //Car color changing button
        fill(250, 0, 0);
        rect(360, 150, 30, 30);
        fill(5, 0, 0);
        rect(365, 165, 20, 8);
        rect(370, 160, 10, 5);
        ellipse(370, 173, 5, 5);
        ellipse(380, 173, 5, 5);
        if(mouseIsPressed && mouseX>360 && mouseX<390 && mouseY>150 && mouseY<180){
            c1=random(0,255);
            c2=random(0,255);
            c3=random(0,255);
        }
        
        //Button to change scene
        fill(0, 255, 170);
        rect(360, 110, 30, 30);
        strokeWeight(7);
        stroke(0, 0, 0);
        point(375, 120);
        strokeWeight(2);
        arc(371, 130, 10, 10, 3, 5);
        arc(379, 130, 10, 10, 4.5, 6.5);
        noStroke();
        fill(0, 0, 0);
        triangle(375, 120, 370, 135, 380, 135);
        
        //Face Change Button
        fill(205, 200, 200);
        rect(360,190,30,30);
        fill(0, 0, 0);
        ellipse(370,200,5,5);
        ellipse(380,200,5,5);
        arc(375,206,20,20,0,3.15);
        
        //Face
        fill(0, 0, 0);
        ellipse(80,160,10,10);
        ellipse(120,160,10,10);
        stroke(255, 0, 0);
        
        //Face change
        if(mouseIsPressed && mouseX>360 && mouseX<390 && mouseY>190 && mouseY<220){
            face+=1;
        }
        if(face>2){
            face=0;
        }
        if(face===0){
            line(80, 190, 120, 190);
        }else if(face===1){
            fill(255, 0, 0);
            arc(100, 185, 40, 50,0,3.15);
        }else if(face===2){
            line(80, 190, 120, 190);
            stroke(0, 0, 0);
            line(70, 145, 90, 150);
            line(130,145,110,150);
        }
        noStroke();
        
        if(mouseIsPressed && mouseX>360 && mouseX<390 && mouseY>110 && mouseY<140){
            button=0;
        }
        if(speed>70){
            fill(255, 255, 255);
            rect(150,102,223,50,20);
            triangle(170,150,190,150,150,170);
            ellipse(80,160,20,20);
            ellipse(120,160,20,20);
            fill(255, 0, 0);
            ellipse(100,190,50,50);
            fill(0, 0, 0);
            ellipse(80,160,10,10);
            ellipse(120,160,10,10);
            textSize(20);
            text("nos vamos a mataaar!!",170,130);
            textSize(12);
        }else if(speed<20){
            fill(255, 255, 255);
            rect(150,100,100,50,20);
            triangle(170,150,190,150,150,170);
            fill(0, 0, 0);
            textSize(20);
            text("Pisele!!",152,130);
            textSize(12);
        }
    }
    
    
    //Throttle
    fill(200, 200, 200);
    rect(10,10,50,100);
    fill(100, 100, 100);
    rect(30,20,10,80);
    strokeWeight(8);
    stroke(5, 0, 0);
    line(35, throttle+4, 35, 60);
    noStroke();
    fill(5, 0, 0);
    rect(20, throttle, 30, 10);
    if(mouseIsPressed && mouseX>10 && mouseX<60 && mouseY>20 && mouseY<100){
        throttle=mouseY;
    }
    
    //Speedometer
    strokeWeight(7);
    stroke(84, 84, 84);
    line(150,50,310,50);
    stroke(255, 250, 250);
    point(speed*2+150, 50);
    text("Velocidad:", 210,20);
    text("5", 150, 40);
    text("100", 200, 40);
    text("200", 250, 40);
    text("NITRO", 290, 40);
    noStroke();
    
    //Movement
    if(speed<-throttle+100){
        speed+=1/4;
    }else if(speed>-throttle+100){
        speed-=1/4;
    }
    xtree1-=speed;
    xtree2-=speed+speed/1/3;
    xtree3-=speed+speed/1;
    road1-=speed+speed/1/2;
    road2-=speed+speed/1/2;
    road3-=speed+speed/1/2;
    road4-=speed+speed/1/2;
    if(xtree2<-60){
        xtree2=460;
    }
    if(xtree1<-50){
        xtree1=450;
    }
    if(xtree3<-70){
        xtree3=470;
    }
    if(road1<-40){
        road1=510;
    }
    if(road2<-40){
        road2=440;
    }
    if(road3<-40){
        road3=440;
    }
    if(road4<-40){
        road4=440;
    }
};
