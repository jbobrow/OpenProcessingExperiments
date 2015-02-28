
void saveVideoFeed() {
  videoFeed_image = createImage(640, 420, RGB);
  opencv.flip(OpenCV.FLIP_HORIZONTAL);
  opencv.remember();
  //videoFeed_image = opencv.image(OpenCV.MEMORY);
  videoFeed_image = opencv.image(OpenCV.FLIP_HORIZONTAL);
}

int setTotalColumns(int cellSize) {
  int answer= videoWidth / cellSize;
  return answer;
}

