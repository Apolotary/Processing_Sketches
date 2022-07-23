import processing.pdf.*;

void setup() {
  size(400, 400);
  background(255);
  stroke(0);
  noLoop();
  smooth(10);
  beginRecord(PDF, "filename.pdf");
}

void draw() {
  for (int diameter = 300; diameter >= 10; diameter -= 10)
  {
    circle(200, 200, diameter);
  }
  loadPixels();
  int offset = -50;
  int yCounter = 50;
  for (int y = 0; y < height; y++) {

    for (int x = 0; x < width; x++) {

      int loc = x + y * width;

      if (get(x, y) != -1){
        int rX = x - offset;
        int randLoc = rX + y * width;
        pixels[loc] = color(255);
        // stroke(255);
        // circle(x, y, 0.1);

        pixels[randLoc] = color(0);
        // stroke(0);
        // circle(rX, y, 0.1);

        if (y - yCounter >= 50){
          yCounter = y;
          offset *= -1;
        }
      } 
    }
  }
  updatePixels();
  saveFrame("circle_jagged.png");
  endRecord();
}
