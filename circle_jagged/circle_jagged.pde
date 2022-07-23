import processing.svg.*;
import processing.pdf.*;

void setup() {
  size(400, 400);
  background(255);
  stroke(0);
  noLoop();
  //beginRecord(SVG, "filename.svg");
  beginRecord(PDF, "filename.pdf");
}

void draw() {
  for (int radius = 250; radius >= 10; radius -= 10)
  {
    circle(200, 200, radius);
  }
  
  loadPixels();
  for (int x = 0; x < width; x++) {
    // Loop through every pixel row
    for (int y = 0; y < height; y++) {
      // Use the formula to find the 1D location
      int loc = x + y * width;
      if (y >= 150 && y <= 250)
      {
        if (get(x, y) != -1)
        {
          int rX = x;
          if (x >= 50 && x <= 200){
            rX = int(random(x-50, 350 - int(random(0, x))));
          } else if (x > 200){
            rX = int(random(x - 50, 200 + int(random(150, x))));
          }
            int randLoc = rX + y * width;
            pixels[loc] = color(255);
            stroke(255);
            //point(x, y);
            circle(x,y,1.0);
            pixels[randLoc] = color(0);
            stroke(0);
            point(rX, y);
            //circle(rX,y,1.0);
        }
      }
    }
  }
  updatePixels();
  endRecord();
}
