
float second, frame, time, diff;
float t1 = millis(), t2 = millis();

void setup(){
    size(100, 100);
    background(#FFFFFF);
}

void draw(){
    counter(123);
}


float counter(float maxLimit){
    if(t1 == 0){
        t1 = millis();
        diff = abs(t1 - t2);
    } else {
        t2 = millis();
        diff = abs(t1 - t2);
        t1 = 0;
    }
    time += diff;
    second = time/1000;
    if(maxLimit == 987){
        time = 0;
    }
    else if(time > maxLimit){
        second = 0;
    }
    println("diff " + diff);
    println("time " + time);
    println("seconds " + second);
    return time;
}
