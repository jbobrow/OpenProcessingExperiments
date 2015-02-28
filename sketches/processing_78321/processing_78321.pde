

int total = 0;

for (int i = 0; i<1000; i++) {
  if (i%3 == 0 || i%5 == 0) {
    total += i;
  }
}

fill(0);
text("n00bS", 0, 50);
text(total,0,70);


