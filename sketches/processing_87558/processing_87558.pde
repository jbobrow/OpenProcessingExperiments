
size(500, 500);
smooth();
strokeWeight(4);

for (int i=20; i <500; i += 20){
    line(i, 0, i + 10, 500);
    line(i + 5, 0, i + 20, 500);
    line(i * 2, 50, i + 2.7, 500);
}


