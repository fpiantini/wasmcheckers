fetch('./func_test.wasm').then(response =>
    response.arrayBuffer()
).then(bytes => WebAssembly.instantiate(bytes)
).then(results => {
    console.log(`Loaded WASM module`)
    instance = results.instance
    console.log(`instance ${instance}`)
    var white = 2
    var black = 1
    var crownedWhite = 6
    var crownedBlack = 5
    console.log("calling offset")
    var offset = instance.exports.offsetForPosition(3, 4)
    console.log(`offset for (3,4) = ${offset}`)
    console.debug(`White is white? ${instance.exports.isWhite(white)}`)
    console.debug(`Black is black? ${instance.exports.isBlack(black)}`)
    console.debug(`Black is white? ${instance.exports.isWhite(black)}`)
    console.debug(`uncrowned white ${instance.exports.isWhite(instance.exports.delCrown(crownedWhite))}`)
    console.debug(`uncrowned black ${instance.exports.isBlack(instance.exports.delCrown(crownedBlack))}`)
    console.debug(`crowned is crowned (w) ${instance.exports.isCrowned(crownedWhite)}`)
    console.debug(`crowned is crowned (b) ${instance.exports.isCrowned(crownedBlack)}`)
})