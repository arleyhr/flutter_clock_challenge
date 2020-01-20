'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "faa764d8be922ec4e2f8f33218929a10",
"/main.dart.js": "54cc55f020e857b0cd722f349f4e02f4",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/manifest.json": "b950979e536ab6eb9d42aa9c9903b1a0",
"/assets/LICENSE": "b2c99a2907d4979f0e680a21aa717eec",
"/assets/AssetManifest.json": "3b593d8e79afa5c320510aac8242645d",
"/assets/third_party/PressStart2P-Regular.ttf": "2c404fd06cd67770807d242b2d2e5a16",
"/assets/FontManifest.json": "b2011471474615c970ed2f9fd522ec6b",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "9a62a954b81a1ad45a58b9bcea89b50b",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
