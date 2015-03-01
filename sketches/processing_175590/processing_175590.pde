

        
        int tileCount = 20;
        void draw (){
        
        StrokeCap (actStrokeCap);
        
        for (int gridY=0; gridY<tileCount; gridY++) {
        for (int gridX=0; gridX<tileCount; gridX++) {
        int posX = width/tileCount*gridX;
        int posY = height/tileCount*gridY;
        int toggle = (int) random (0,2);
       
        if (toggle ==0) {
        strokeWeight (mouseX/20);
        line (posX, posY, posX+width/tileCount, posY_height/tileCount);
        }       
        if (toggle ==1) {
        strokeWeight (mouseY/20);
        line(posX, posY+width/tileCount, posX+height/tileCount, posY);
        }
        void keyReleased(){
        if (key=='1') {
        actStrokeCap = ROUND;
        }
        if (key =='2') {
        actStrokeCap = SQUARE;
        }
        if (key =='3') {
        {
        actStrokeCap = PROJECT 
        }
        }
