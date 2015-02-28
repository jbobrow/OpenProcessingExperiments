
// HSB color mode
// using "translate" to move the origin four times
// by the same distance, drawing 4 offset squares

size(200, 200);
colorMode(HSB);

fill(0, 255, 255);
translate(20, 20);
rect(0, 0, 100, 100);

fill(16, 255, 255);
translate(20, 20);
rect(0, 0, 100, 100);

fill(32, 255, 255);
translate(20, 20);
rect(0, 0, 100, 100);

fill(48, 255, 255, 180);
translate(20, 20);
rect(0, 0, 100, 100);

