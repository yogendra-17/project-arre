const express = require('express');
const app = express();
const PORT = 3000;

// placeholder for the group messages
let groupMessages = [];




// API to load all the group messages in a paginated manner
app.get('/group-messages', (req, res) => {
    const page = req.query.page || 1;
    const pageSize = req.query.pageSize || 10;

    const startIndex = (page - 1) * pageSize;
    const endIndex = startIndex + pageSize;

    const paginatedMessages = groupMessages.slice(startIndex, endIndex);
    res.json(paginatedMessages);
});

// API to create a message in the group
app.post('/group-messages', (req, res) => {
    const message = req.body;
    groupMessages.push(message);
    res.json({ message: 'Message added to the group chat' });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
