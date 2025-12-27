# PGEGameKit

A kid-friendly SpriteKit helper library for **Swift Playgrounds App projects**.

**Goal:** make it easy for students to build interactive scenes fast, with a simple mental model:
> Add shapes to `canvas`, where **(0,0)** is always the **middle of the screen**.

---

## What this means (student-friendly)

You can:
- ✅ Use this in class, at home, or in a school club
- ✅ Change the code and experiment
- ✅ Share your project with friends/teachers
- ✅ Build games and animations for learning

Please don’t:
- ❌ Sell this library or repackage it as your own paid “coding kit”
- ❌ Use “Playground Engineer” branding to promote your own product

If you want to use this in a paid product/program, that’s totally possible — you’ll just need a **commercial license**.

---

## Licenses (dual-license)

- **Educational License (default):** `LICENSE-EDUCATIONAL.txt`
- **Commercial License (paid):** `LICENSE-COMMERCIAL.txt`

Commercial use includes paid apps, paid curriculum, paid platforms, or bundling this library into something you sell.

---

## Install in Swift Playgrounds (App project)

1) Unzip this repo/folder.
2) Add the **PGEGameKit** folder (the one with `Package.swift`) into your Swift Playgrounds App project.
3) Import it:

```swift
import PGEGameKit
```

---

## Quick start (kid API)

```swift
import SpriteKit
import PGEGameKit

setScene()
showGrid()

let circle = ShapeNode(circleOfRadius: 50.0)
circle.position = CGPoint(x: 0, y: 150)
canvas.addChild(circle)
```

---

## Show the game view

Use `PGEGameView()` as your app’s root view:

```swift
import SwiftUI
import PGEGameKit

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            PGEGameView()
                .task {
                    setScene()
                    showGrid()
                    // add nodes...
                }
        }
    }
}
```

---

## Notes (for instructors)

- `GameScene.anchorPoint` is set to `(0.5, 0.5)` so `(0,0)` is the center.
- The `canvas` automatically resizes on rotation / split-view changes.
- `showGrid()` is safe to call multiple times (it replaces the previous grid).

