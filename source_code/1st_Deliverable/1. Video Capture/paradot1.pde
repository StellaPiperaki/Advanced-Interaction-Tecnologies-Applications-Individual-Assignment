
import processing.video.*;
Capture video;

void setup() {
  size(420, 340);
  println(Capture.list());

  video = new Capture(this, 420, 340);
  video.start();
}

void captureEvent(Capture video) {

  video.read();
}

void draw() {

  image(video, 0, 0);
}
