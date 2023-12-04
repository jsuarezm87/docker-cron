
let times = 0;

const syncDB = () => {
    times++;
    console.log('Tick cada 5 segusdos:', times);
    return times;
}

module.exports = {
    syncDB
}