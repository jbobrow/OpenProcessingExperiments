
int SIZE_ARRAY = 100;
int[] myArray;
int aux;
int i = SIZE_ARRAY;
int j = 0;

float columnSize;

void setup(){
    size(512, 512);
    background(255);
    myArray = new int[SIZE_ARRAY];

    for (int i = 0; i<SIZE_ARRAY; i++){
        myArray[i] = (int) random(400);
    }
    
    columnSize = width/SIZE_ARRAY;
    frameRate(1000);
}

void draw(){
    println("i: "+i);
    println("j: "+j);
    background(255);

    for (int k = 0; k < myArray.length; k++){

        stroke(255);
        fill(0,100,100);

        if(k == j || k == j + 1){
          fill(100,0,0);
        }

        rect(k*columnSize + 5, height - myArray[k], columnSize, myArray[k]);
    }
    
    bubbleSort(myArray);
}

void keyPressed(){
    switch (key){
        case 's' :
            i = SIZE_ARRAY;
            j = 0;
            setup();
        break;    
    }
}

void mousePressed(){
    frameRate( frameRate <= 100 ? 1000 : 30);
}

/*======================================
|| Ordenações
=======================================*/

void bubbleSort(int[] vector){
    if(i > 0){
        if(j < i - 1){
            if(vector[j] > vector[j + 1]){
                aux = vector[j];
                vector[j] = vector[j + 1];
                vector[j + 1] = aux;
            }
            j++;
        }else{
            i--;
            j = 0;
        }
    }
}
