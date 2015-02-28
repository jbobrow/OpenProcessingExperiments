
PImage sourcePicture;
PImage newPicture;
int blockScale; // im większa skala, tym mniejsze bloki
int loopCount; // ilość powtórzeń pętli; im większa wartość, tym więcej bloków
int rand; // decyduje, czy blok zostanie przeniesiony, czy nie
int randLowerLimit; // dolny 
// zakres losowania
int randUpperLimit; // górny
int randThreshold; // najniższa wartość losowania, po której blok zostaje przeniesiony
// im większa, tym mniej bloków
int dimension;

// zmienne związane liczbą przerysowań na sekundę
int initialTime;
int runCount;
int interval;

void setup() {
  size(400, 400);

  // poniższe wartości możesz zmieniać na swoje, legenda wyżej, miłej zabawy
  sourcePicture = loadImage("vienna.jpg");
  blockScale = 2;
  loopCount = 10;
  randLowerLimit = 0;
  randUpperLimit = 100;
  randThreshold = 50;
  
  // tego już nie dotykaj
  newPicture = createImage(sourcePicture.width, sourcePicture.height, RGB);
  dimension = sourcePicture.width * sourcePicture.height;
  initialTime = millis();
  interval = 500;
}

void draw() {
  if (millis() - initialTime > interval) { // odpalaj tylko co ustalony interwał
    initialTime = millis();
    
    // zezwól na korzystanie z metody pixels
    sourcePicture.loadPixels();
    newPicture.loadPixels();

    newPicture.copy(sourcePicture, 0, 0, sourcePicture.width, sourcePicture.width, 0, 0, sourcePicture.width, sourcePicture.width);

    for (int i = 0; i < loopCount; i++) { // główna pętla

      // ustal szerokość i wysokość przenoszonego bloku
      int blockWidth = int(random(sourcePicture.width)/blockScale);
      int blockHeight = int(random(sourcePicture.height)/blockScale);

      int lengthLimit = int(dimension - blockWidth); // ilość pikseli - szerokość przenoszonego bloku

      // losowe piksele
      int randomPixel1 = int(random(0, dimension - blockWidth)); // randomPixel2 będzie skopiowany na miejsce randomPixel1 
      int randomPixel2 = int(random(0, dimension - blockWidth));

      // losowanie
      rand = int(random(randLowerLimit, randUpperLimit));

      // sprawdź, czy jest miejsce na przeniesienie bloku
      if ((rand >= randThreshold)&& (randomPixel1 + sourcePicture.width * blockHeight < lengthLimit) && (randomPixel2 + sourcePicture.width * blockHeight < lengthLimit)) {
        for (int y = 0; y <= blockHeight; y++) { // zapętl po wierszach
          for (int x = 0; x <= blockWidth; x++) { // przełącz na kolejne piksele w przenoszonych blokach
            newPicture.pixels[randomPixel1 + x] = sourcePicture.pixels[randomPixel2 + x];
          };
          randomPixel1 = randomPixel1 + sourcePicture.width; // przełącz na kolejny wiersz
          randomPixel2 = randomPixel2 + sourcePicture.width;
        };
      };
    };

    newPicture.updatePixels();
    image(newPicture, 0, 0, 400, 400); // rysuje obraz
  };
};


